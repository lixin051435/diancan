package com.byh.biyesheji.Interceptor;

import com.byh.biyesheji.pojo.Customer;
import org.apache.commons.lang.StringUtils;
import com.byh.biyesheji.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;

/**
 * 前台登陆状态拦截器  如果访问的请求没有在noNeedAuthPage数组就跳转登陆
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    OrderItemService orderItemService;

    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String contextPath=session.getServletContext().getContextPath()+"/fore";
        //准备字符串数组 noNeedAuthPage，存放哪些不需要登录也能访问的路径
        String[] noNeedAuthPage = new String[]{
                "Index", //首页
                "DetailUI", //商品详情页
                "RegisterUI",  //注册页
                "Register",  //注册
                "LoginUI",  //登陆页
                "Login",     //登陆
                "IsLogin",  //判断是否登陆
                "MtLogin", //模态登陆验证
                "CstLoginOut", //退出
                "DelOrderItem",//删除购物车项
                "CreateOrder", //提交订单
                "Payed", //支付成功
                "NameLike", //模糊搜索商品
                "FindCategory", //查看分类下的商品
                "Zixunadd", //添加资讯
                "LoginMsg", //登陆返回信息
        };
        //获取uri
        String uri = request.getRequestURI(); //访问首页 /fore/foreIndex
        //去掉前缀/fore
        uri = uri.substring(5,uri.length());  //去掉前缀后 /foreIndex
        //如果访问的地址是/fore开头
        if(uri.startsWith("/fore")){
            //判断是否是在noNeedAuthPage
            String method = StringUtils.substringAfterLast(uri,"/fore" ); // 取出/fore后的字符串：Index
            //如果不在，那么就需要进行是否登录验证
            if(!Arrays.asList(noNeedAuthPage).contains(method)){
                Customer customer =(Customer) session.getAttribute("cst");
                if(null==customer){
                    response.sendRedirect("foreLoginUI");
                    return false;
                }
            }
        }

        return true;

    }


   
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
       // super.postHandle(request, response, handler, modelAndView);
    }

    /**

     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
       // super.afterCompletion(request, response, handler, ex);
    }
}
