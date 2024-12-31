<%-- 
    Document   : insert
    Created on : 27 nov 2024, 12:20:23
    Author     : Flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%if ("insert".equals(request.getParameter("action"))){%>
            <title>Insertar Alumno</title>
        <%}else{%>
            <title>Actualizar Alumno</title>
        <%}%>
        
        
        
    </head>
    <body>
        <div class="container">
            <form action="students.jsp" method="post">
                <div class="row">
                    <div class="col-12">
                        <%if ("insert".equals(request.getParameter("action"))){%>
                        <h1 class="text-center mt-3">Insertar Alumno</h1>
                        <%}else{%>
                        <h1 class="text-center mt-3">Actualizar Alumno</h1>
                        <%}%>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Nombre del alumno</label>
                        <%if ("insert".equals(request.getParameter("action"))){%>
                        <input type="text" class="form-control" name="name"/>
                        <%}else{%>
                        <input type="text" class="form-control" name="name" value="<%=request.getParameter("name")%>"/>
                        <%}%>
                    </div>
                    <div class="mb-3">
                        <label for="surnames" class="form-label">Apellidos del alumno</label>
                        <%if ("insert".equals(request.getParameter("action"))){%>
                        <input type="text" class="form-control" name="surnames"/>
                        <%}else{%>
                        <input type="text" class="form-control" name="surnames" value="<%=request.getParameter("surnames")%>"/>
                        <%}%>
                    </div>
                    <div class="mb-3">
                        <label for="age" class="form-label">Edad del alumno</label>
                        <%if ("insert".equals(request.getParameter("action"))){%>
                        <input type="text" class="form-control" name="age"/>
                        <%}else{%>
                        <input type="text" class="form-control" name="age" value="<%=request.getParameter("age")%>"/>
                        <%}%>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Dirección del alumno</label>
                        <%if ("insert".equals(request.getParameter("action"))){%>
                        <input type="text" class="form-control" name="address"/>
                        <%}else{%>
                        <input type="text" class="form-control" name="address" value="<%=request.getParameter("familyData")%>"/>
                        <%}%>
                    </div>
                    <div class="mb-3">
                        <label for="course" class="form-label">Curso del alumno</label>
                        <select class="form-select" name="course">
                            <%if ("insert".equals(request.getParameter("action"))){%>
                            <option>Seleccionar Curso</option>
                            <option value="1">1º ESO</option>
                            <option value="2">2º ESO</option>
                            <option value="3">3º ESO</option>
                            <option value="4">4º ESO</option>
                            <option value="5">1º BACHILLERATO</option>
                            <option value="6">2º BACHILLERATO</option>
                            <option value="7">1º CFGM</option>
                            <option value="8">2º CFGM</option>
                            <option value="9">1º CFGS</option>
                            <option value="10">2º CFGS</option>
                            <%}else{%>
                            <option value="1" <%= "1º ESO".equals(request.getParameter("course")) ? "selected" : "" %>>1º ESO</option>
                            <option value="2" <%= "2º ESO".equals(request.getParameter("course")) ? "selected" : "" %>>2º ESO</option>
                            <option value="3" <%= "3º ESO".equals(request.getParameter("course")) ? "selected" : "" %>>3º ESO</option>
                            <option value="4" <%= "4º ESO".equals(request.getParameter("course")) ? "selected" : "" %>>4º ESO</option>
                            <option value="5" <%= "1º BACHILLERATO".equals(request.getParameter("course")) ? "selected" : "" %>>1º BACHILLERATO</option>
                            <option value="6" <%= "2º BACHILLERATO".equals(request.getParameter("course")) ? "selected" : "" %>>2º BACHILLERATO</option>
                            <option value="7" <%= "1º CFGM".equals(request.getParameter("course")) ? "selected" : "" %>>1º CFGM</option>
                            <option value="8" <%= "2º CFGM".equals(request.getParameter("course")) ? "selected" : "" %>>2º CFGM</option>
                            <option value="9" <%= "1º CFGS".equals(request.getParameter("course")) ? "selected" : "" %>>1º CFGS</option>
                            <option value="10" <%= "2º CFGS".equals(request.getParameter("course")) ? "selected" : "" %>>2º CFGS</option>
                            <%}%>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Nota del alumno</label>
                        <select class="form-select" name="grade">
                            <%if ("insert".equals(request.getParameter("action"))){%>
                            <option selected>Seleccionar nota</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>>
                            <%}else{%>
                            <option value="1" <%= "1".equals(request.getParameter("grade")) ? "selected" : "" %>>1</option>
                            <option value="2" <%= "2".equals(request.getParameter("grade")) ? "selected" : "" %>>2</option>
                            <option value="3" <%= "3".equals(request.getParameter("grade")) ? "selected" : "" %>>3</option>
                            <option value="4" <%= "4".equals(request.getParameter("grade")) ? "selected" : "" %>>4</option>
                            <option value="5" <%= "5".equals(request.getParameter("grade")) ? "selected" : "" %>>5</option>
                            <option value="6" <%= "6".equals(request.getParameter("grade")) ? "selected" : "" %>>6</option>
                            <option value="7" <%= "7".equals(request.getParameter("grade")) ? "selected" : "" %>>7</option>
                            <option value="8" <%= "8".equals(request.getParameter("grade")) ? "selected" : "" %>>8</option>
                            <option value="9" <%= "9".equals(request.getParameter("grade")) ? "selected" : "" %>>9</option>
                            <option value="10" <%= "10".equals(request.getParameter("grade")) ? "selected" : "" %>>10</option>
                            <%}%>

                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Datos de la familia</label>
                        <textarea rows="3" cols="4" class="form-control" name="familyData"><%=request.getParameter("address") != null ? request.getParameter("address") : "" %></textarea>
                    </div>
                </div>
                <%if("true".equals(request.getParameter("photo")) && "update".equals(request.getParameter("action"))){%>
                <input class="form-check-input" type="checkbox" value="photo" name="picture" checked/>
                <%}else{%>
                <input class="form-check-input" type="checkbox" value="photo" name="picture"/>
                <%}%>
                <label class="form-check-label" for="flexCheckDefault">Consentimiento de uso para foto</label>
                <br/><br/>
                <div class="row-2">
                    <div class="col-12">
                        <% if ("insert".equals(request.getParameter("action"))){%>
                            <input type="hidden" name="action" value="insert"/>
                            <input type="hidden" name="success" value="Estudiante añadido correctamente"/>
                            <input type="submit" name="action" value="Insertar" class="btn btn-primary btn-log col-12"/>
                        <%}else{%>
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="success" value="Estudiante actualizado correctamente"/>
                            <input type="submit" name="action" value="Actualizar" class="btn btn-warning btn-log col-12"/>
                        <%}%>
                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
