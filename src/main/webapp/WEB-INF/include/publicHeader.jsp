
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper" style="background-color:rgb(129,216,209)">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl" style="background-color:rgb(129,216,209)">
            
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/index">吃不够点餐管理首页</a>

            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>
                        <c:if test="${subject.hasRole('admin')}">
                            欢迎使用
                         </c:if>
                        <c:if test="${!subject.hasRole('admin')}">
                            欢迎使用
                        </c:if>
                    </li>
                    <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${subject.principal}</a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${pageContext.request.contextPath}/islogout">退出</a></li>
                        </ul>
                    </li>

                  
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--/_header 作为公共模版分离出去-->
