
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">

    <div class="menu_dropdown bk_2" style="background-color:rgb(129,216,209)">
      
        <dl id="menu-member" style="background-color:rgb(129,216,209)">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li style="background-color:rgb(129,216,209)"><a href="/customer/list" title="用户列表" style="background-color:rgb(129,216,209)">用户列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i> 美食管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/product/list" title="美食列表" style="background-color:rgb(129,216,209)">美食列表</a></li>
                    <li><a href="/category/list" title="美食产品分类管理" style="background-color:rgb(129,216,209)">美食分类管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/review/list" title="评论列表" style="background-color:rgb(129,216,209)">评论列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-picture">
            <dt><i class="Hui-iconfont">&#xe613;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a href="/order/list" title="订单列表" style="background-color:rgb(129,216,209)">订单列表</a></li>
                </ul>
            </dd>
        </dl>
        
     
        <c:if test="${subject.hasRole('admin')}">
            <dl id="menu-system">
                <dt><i class="Hui-iconfont">&#xe62e;</i> 美食资讯管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
                <dd>
                    <ul>
                        <li><a href="/zixun/list" title="美食资讯列表" style="background-color:rgb(129,216,209)">美食列表</a></li>
                    </ul>
                </dd>
            </dl>
        </c:if>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->
