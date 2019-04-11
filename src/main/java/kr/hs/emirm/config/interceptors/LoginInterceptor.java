package kr.hs.emirm.config.interceptors;

import kr.hs.emirm.common.data.CommonData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor {


    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession(true);

        if(StringUtils.isEmpty(session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()))){
            logger.info("Session Time Out : ");
            response.sendRedirect("/");

            return false;
        }else{
            if(request.getServletPath().split("/")[1].equals(session.getAttribute(CommonData.SESS_LOGIN_TYPE.getKey()))){
                logger.info("Session User Id : " + session.getAttribute(CommonData.SESS_LOGIN_ID.getKey()));
                session.setMaxInactiveInterval(60 * 60);
            }else{
                logger.info("Invalid Access to : "+request.getServletPath());
                response.sendRedirect("/");
                return false;
            }

            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }
}
