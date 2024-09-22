<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Film App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { box-shadow: 0 2px 4px rgba(0,0,0,.1); }
        .card { box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); border-radius: 10px; }
        .table thead { background-color: #343a40; color: white; }
        .table tbody tr:hover { background-color: #f1f1f1; }
        .btn-action { width: 100px; margin-bottom: 5px; }
        .btn { border-radius: 5px; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-film me-2"></i>Film App
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/list">Films</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h3 class="mb-0">List of Films</h3>
                    </div>
                    <div class="card-body">
                        <div class="mb-3 text-end">
                            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">
                                <i class="fas fa-plus me-2"></i>Add New Film
                            </a>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Year</th>
                                        <th>Director</th>
                                        <th>Stars</th>
                                        <th>Review</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="films" items="${listFilms}">
                                        <tr>
                                            <td><c:out value="${films.id}" /></td>
                                            <td><c:out value="${films.title}" /></td>
                                            <td><c:out value="${films.year}" /></td>
                                            <td><c:out value="${films.director}" /></td>
                                            <td><c:out value="${films.stars}" /></td>
                                            <td><c:out value="${films.review}" /></td>
                                            <td>
                                                <a href="edit?id=<c:out value='${films.id}' />" class="btn btn-primary btn-sm btn-action">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <a href="delete?id=<c:out value='${films.id}' />" class="btn btn-danger btn-sm btn-action">
                                                    <i class="fas fa-trash"></i> Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

