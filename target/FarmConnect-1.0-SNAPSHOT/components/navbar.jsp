<%@page import="com.learn.FarmConnect.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
    String currentPage = request.getRequestURI(); // Get the current page URI
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <span class="navbar-brand">FarmConnect</span>
                </li>
                <li class="nav-item <%= currentPage.contains("admin.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="admin.jsp">Home</a>
                </li>
                <li class="nav-item <%= currentPage.contains("about.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>

                <% if (user1 != null) { %> <!-- Only show "Products" if the user is logged in -->
                <li class="nav-item <%= currentPage.contains("index.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="index.jsp">Products</a>
                </li>
                <% } %>
            </ul>

            <ul class="navbar-nav ml-auto">

                <%-- Hide cart option on login and register pages --%>
                <% if (user1 != null && !currentPage.contains("login.jsp") && !currentPage.contains("register.jsp")) { %>
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">
                        <i class="fa fa-cart-plus" style="font-size: 20px;"></i>
                        <span class="ml-0 cart-items">( 0 )</span>
                    </a>
                </li>
                <% } %>

                <% if (user1 == null) { %> <!-- If user is not logged in, show Login/Register buttons -->
                <li class="nav-item <%= currentPage.contains("login.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item <%= currentPage.contains("register.jsp") ? "active" : "" %>">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <% } else { %> <!-- If user is logged in, show user options -->
                <li class="nav-item">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>">
                        <%= user1.getUserName() %>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <% } %>

            </ul>
        </div>
    </div>
</nav>
