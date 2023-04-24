package servlet;

import Utils.Constant;
import bean.ComBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


/**
 * 用户服务连接器
 */
public class AdminServlet extends HttpServlet {

    public AdminServlet(){
        super();
    }

    //Servlet
    /**
     *
     * 当表单的 tag value 方法等于 get 时，调用此方法。
     *
     * @param request 客户端发送给服务器的请求
     * @param response 服务器发送给客户端的响应
     * @throws ServletException
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request,response);
    }

    /**
     *
     * 当窗体的标记值方法等于 post 时调用此方法。
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);

        String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

        try{
            String method = request.getParameter("method").trim();
            ComBean comBean = new ComBean();
            HttpSession httpSession = request.getSession();
            if (method.equals("UserLogin")){//用户登录
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String type = request.getParameter("type");
                String sql = "select real_name from admin where username = '" + username + "' and  password = '" + password + "'  and  type = '" + type + "';";
                String result = comBean.getSqlResult(sql);
                if (result == null){
                    request.setAttribute("message","登录信息错误！");
                    //请求转发前后页面分享一个request，表示下一步跳到哪个页面
                    //用于与后台之间的交互的，主要是页面的跳转
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }else {
                    httpSession.setAttribute("user",username);
                    httpSession.setAttribute("type",type);
                    request.getRequestDispatcher("admin/index.jsp").forward(request,response);
                }
            }else if (method.equals("adminexit")){
                System.out.println("退出");
                httpSession.removeAttribute("user");
                httpSession.removeAttribute("type");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        }catch (Exception e){
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp");
        }

    }

}
