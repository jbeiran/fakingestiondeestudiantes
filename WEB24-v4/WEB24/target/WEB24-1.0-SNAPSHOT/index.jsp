<%-- 
    Document   : index
    Created on : 10 dic 2024, 8:21:07
    Author     : Flavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <div class="container-fluid">
            <%if (request.getParameter("error") != null && request.getParameter("error").equals("invalid_credentials")){%>
            <div class="row">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="dangerAlert" style="display: flex; align-items: center;">
                    <h4 class="text-center flex-grow-1">Credenciales Erróneas</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick="this.parentElement.style.display='none'"></button>
                </div>
            </div>
            <%}%>
            <h1 class="text-center">Iniciar Sesión</h1>
            <form action="students.jsp" name="login" method="get">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row">
                            <div class="mb-3">
                                <label for="user" class="form-label">Usuario</label>
                                <input type="text" class="form-control" name="user"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-2"></div>
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row">
                            <div class="mb-3">
                                <label for="passwd" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" name="passwd"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <div class="row">
                            <div class="mb-4">
                                <input type="hidden" name="login" value="login"/>
                                <button class="btn btn-success col-12">Iniciar Sesión</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
