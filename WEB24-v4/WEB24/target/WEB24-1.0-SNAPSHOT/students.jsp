<%-- 
    Document   : index
    Created on : 26 nov 2024, 9:55:38
    Author     : Flavio
--%>
<%@page import="controllers.StudentController" %>
<%@page import="models.Student" %>
<%@page import="connections.ConnectionToDB" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Gestión de alumnos - IES El Rincón</title>
    </head>
    <body>
        <%
            var con = new ConnectionToDB().getConnection();
            var nick = "";
            var sqlQuery = con.prepareStatement("select * from admins where nick=? and passwd=?;");
            sqlQuery.setString(1, request.getParameter("user"));
            sqlQuery.setString(2, request.getParameter("passwd"));
            var rs = sqlQuery.executeQuery();
            if (rs.next()){
                session = request.getSession();
                session.setAttribute("user", rs.getString("nick"));
                nick = rs.getString("nick");
            }else response.sendRedirect("index.jsp?error=invalid_credentials");
            var controller = new StudentController();
            var action = request.getParameter("action");
            var message = request.getParameter("success");
            var course = "";
            if (action != null){
                switch(action){
                    case "insert": if (controller.insertStudent(
                                    request.getParameter("name"),
                                    request.getParameter("surnames"),
                                    Integer.parseInt(request.getParameter("age")),
                                    Integer.parseInt(request.getParameter("grade")),
                                    request.getParameter("address"),
                                    Integer.parseInt(request.getParameter("course")),
                                    request.getParameter("familyData"),
                                    "photo".equals(request.getParameter("picture"))
                                    )) message = "Alumno insertado correctamente";
                                    else message = "Error al insertar alumno";
                                    break;
                    case "update": if (controller.updateStudent(
                                    request.getParameter("name"),
                                    request.getParameter("surnames"),
                                    Integer.parseInt(request.getParameter("age")),
                                    Integer.parseInt(request.getParameter("grade")),
                                    request.getParameter("address"),
                                    Integer.parseInt(request.getParameter("course")),
                                    request.getParameter("familyData"),
                                    "photo".equals(request.getParameter("picture")),
                                    Integer.parseInt(request.getParameter("id"))
                                    )) message = "Alumno actualizado correctamente";
                                    else message = "Error al actulizar alumno";
                                    break;
                    case "delete": if (controller.deleteStudent(Integer.parseInt(request.getParameter("id")))) message = "Alumno eliminado correctamente";
                                   else message = "Error al eliminar alumno"; break;
                }
            }
            var students = controller.getStudents();%>
        <div class="container-fluid">
            <% if(message != null){
                  if (!message.contains("Error")){%>
            <div class="row">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert" style="display: flex; align-items: center;">
                    <h4 class="text-center flex-grow-1"><%=message%></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick="this.parentElement.style.display='none'"></button>
                </div>
            </div>
                    <%}else{%>
            <div class="row">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="dangerAlert" style="display: flex; align-items: center;">
                    <h4 class="text-center flex-grow-1"><%=message%></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick="this.parentElement.style.display='none'"></button>
                </div>
            </div>
            <%       }
            }%>
            <div class="row">
                <div class="col-12">
                    <a href="index.jsp">Cerrar sesión, <b><%=nick%></b></a>
                    <h1 class="text-center">Gestión de alumnado - IES El Rincón</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Edad</th>
                                <th>Nota</th>
                                <th>Curso</th>
                                <th>Dirección</th>
                                <th>Datos Familiares</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Student student: students){%>
                            <tr>
                                <form>
                                    <td><%=student.id()%></td>
                                    <td><%=student.name()%></td>
                                    <td><%=student.surnames()%></td>
                                    <td><%=student.age()%></td>
                                    <td><%=student.grade()%></td>
                                    <%switch(student.course()){
                                        case 1: course = "1º ESO"; break;
                                        case 2: course = "2º ESO"; break;
                                        case 3: course = "3º ESO"; break;
                                        case 4: course = "4º ESO"; break;
                                        case 5: course = "1º BACHILLERATO"; break;
                                        case 6: course = "2º BACHILLERATO"; break;
                                        case 7: course = "1º CFGM"; break;
                                        case 8: course = "2º CFGM"; break;
                                        case 9: course = "1º CFGS"; break;
                                        case 10: course = "2º CFGS"; break;
                                    }%>
                                    <td>
                                        <%=course%>
                                    </td>
                                    <td>
                                        <%=student.address()%>
                                    </td>
                                    <td>
                                        <%=student.familyData()%>
                                    </td>
                                    <%if(student.photo()){%>
                                    <td>
                                        <input type="checkbox" checked disabled/></td>
                                    <%}else{%>
                                    <td>
                                        <input type="checkbox" disabled/>
                                    </td>
                                    <%}%>
                                </form>
                                <td>
                                    <form action="insert.jsp" name="update" method="post">
                                        <input type="hidden" name="action" value="update"/>
                                        <input type="hidden" name="id" value="<%=student.id()%>"/>
                                        <input type="hidden" name="name" value="<%=student.name()%>"/>
                                        <input type="hidden" name="surnames" value="<%=student.surnames()%>"/>
                                        <input type="hidden" name="age" value="<%=student.age()%>"/>
                                        <input type="hidden" name="grade" value="<%=student.grade()%>"/>
                                        <input type="hidden" name="course" value="<%=course%>"/>
                                        <input type="hidden" name="address" value="<%=student.address()%>"/>
                                        <input type="hidden" name="familyData" value="<%=student.familyData()%>"/>
                                        <input type="hidden" name="photo" value="<%=student.photo()%>"/>
                                        <button class="btn btn-warning">Actualizar</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="students.jsp" method="get">
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="id" value="<%=student.id()%>"/>
                                        <input type="hidden" name="success" value="Estudiante eliminado correctamente"/>
                                        <input type="hidden" name="user" value="<%=request.getParameter("user")%>"/>
                                        <input type="hidden" name="passwd" value="<%=request.getParameter("passwd")%>"/>
                                        <input type="submit" class="btn btn-danger" value="Eliminar">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <form action="insert.jsp" name="insert" method="get">
                        <input type="hidden" name="action" value="insert"/>
                        <button class="btn btn-success col-12">Insertar Alumno</button>
                    </form>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
    </body>
</html>