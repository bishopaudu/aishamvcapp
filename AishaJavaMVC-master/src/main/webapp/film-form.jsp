<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Film Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar { box-shadow: 0 2px 4px rgba(0,0,0,.1); }
        .card { box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); border-radius: 10px; }
        label { font-weight: bold; }
        .btn { border-radius: 5px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-primary">
    <div class="container">
        <a href="#" class="navbar-brand">Film App</a>
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Films</a></li>
        </ul>
    </div>
</nav>

<div class="container col-md-5 mt-5">
    <div class="card">
        <div class="card-header bg-primary text-white text-center">
            <h3>
                <c:if test="${film != null}">Edit Film</c:if>
                <c:if test="${film == null}">Add New Film</c:if>
            </h3>
        </div>
        <div class="card-body">
            <c:if test="${film != null}">
                <form action="update" method="post">
            </c:if>
            <c:if test="${film == null}">
                <form action="insert" method="post">
            </c:if>
                <c:if test="${film != null}">
                    <input type="hidden" name="id" value="<c:out value='${film.id}' />" />
                </c:if>

                <div class="mb-3">
                    <label>Film Title</label>
                    <input type="text" value="<c:out value='${film.title}' />" class="form-control" name="title" required>
                </div>

                <div class="mb-3">
                    <label>Release Year</label>
                    <input type="text" value="<c:out value='${film.year}' />" class="form-control" name="year">
                </div>

                <div class="mb-3">
                    <label>Director</label>
                    <input type="text" value="<c:out value='${film.director}' />" class="form-control" name="director">
                </div>

                <div class="mb-3">
                    <label>Stars</label>
                    <input type="text" value="<c:out value='${film.stars}' />" class="form-control" name="stars">
                </div>

                <div class="mb-3">
                    <label>Review</label>
                    <textarea class="form-control" name="review" rows="4"><c:out value='${film.review}' /></textarea>
                </div>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

