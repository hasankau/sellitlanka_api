/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebServices;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import jdbc.DBConnect;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    @WebMethod(operationName = "getAds")
    public String getAds() {
        String ret = "lllllllll";
        JSONArray jr = new JSONArray();
        try {
            ResultSet rs = DBConnect.getConnection().createStatement().executeQuery("SELECT *, district FROM advert inner join district ON advert.district_id = district.id WHERE status=1");

            while (rs.next()) {

                JSONObject jsono = new JSONObject();
                jsono.put("id", rs.getInt("id"));
                jsono.put("title", rs.getString("title"));
                jsono.put("content", rs.getString("content"));
                jsono.put("district", rs.getString("district"));
                jsono.put("user_id", rs.getString("user_id"));
                jsono.put("adtype", rs.getString("ad_type_id"));
                jsono.put("main_catagory_id", rs.getString("main_catagory_id"));
                jsono.put("sub_catagory_id", rs.getString("sub_catagory_id"));
                jsono.put("views", rs.getString("views"));
                jsono.put("status", rs.getString("status"));
                jsono.put("price", rs.getString("price"));
                jsono.put("image", rs.getString("image"));
                jsono.put("phone", rs.getString("phone"));
                jsono.put("paid", rs.getString("paid"));
                jsono.put("email", rs.getString("email"));

                jr.put(jsono);
            }
            ret = jr.toString();
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ret;
    }
    
    
    
    
    @WebMethod(operationName = "getsearchads")
    public String getsearchads(@WebParam (name = "key") String key) {
        String ret = "lllllllll";
        JSONArray jr = new JSONArray();
        try {
            ResultSet rs = DBConnect.getConnection().createStatement().executeQuery("SELECT *, district FROM advert inner join district ON advert.district_id = district.id WHERE status=1 and (title like '%"+key+"%' or content like '%"+key+"%') ");

            while (rs.next()) {

                JSONObject jsono = new JSONObject();
                jsono.put("id", rs.getInt("id"));
                jsono.put("title", rs.getString("title"));
                jsono.put("content", rs.getString("content"));
                jsono.put("district", rs.getString("district"));
                jsono.put("user_id", rs.getString("user_id"));
                jsono.put("adtype", rs.getString("ad_type_id"));
                jsono.put("main_catagory_id", rs.getString("main_catagory_id"));
                jsono.put("sub_catagory_id", rs.getString("sub_catagory_id"));
                jsono.put("views", rs.getString("views"));
                jsono.put("status", rs.getString("status"));
                jsono.put("price", rs.getString("price"));
                jsono.put("image", rs.getString("image"));
                jsono.put("phone", rs.getString("phone"));
                jsono.put("paid", rs.getString("paid"));
                jsono.put("email", rs.getString("email"));

                jr.put(jsono);
            }
            ret = jr.toString();
        } catch (Exception ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ret;
    }

    
    
    
    
    

    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {
        JSONObject jr = new JSONObject();

        try {

            if (!email.isEmpty() && !password.isEmpty()) {
                String temail = email;
                String tpassword = password;

                String sql = ("SELECT id FROM user WHERE email='" + temail + "' AND password='" + tpassword + "'");

                ResultSet rs = DBConnect.getConnection().createStatement().executeQuery(sql);

                if (rs.first()) {
                    jr.put("data", 1);
                    jr.put("user", rs.getString(1));
                } else {
                    jr.put("data", 2);
                }
            } else {
                jr.put("data", 0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr.toString();

    }
    
    
    
    
    
    
    
    

    @WebMethod(operationName = "signup")
    public String signup(@WebParam(name = "email") String email, @WebParam(name = "uname") String uname, @WebParam(name = "password") String password) {
        JSONObject jr = new JSONObject();

        try {

            if (!uname.isEmpty() && !email.isEmpty() && !password.isEmpty()) {
                String temail = email;
                String tuname = uname;
                String tpassword = password;

                String sql = ("INSERT INTO user(user_name,email,password)VALUES ('" + tuname + "','" + temail + "','" + tpassword + "')");

                boolean b = DBConnect.getConnection().createStatement().execute(sql);

                String id = ("SELECT max(id) from user");

                ResultSet rs = DBConnect.getConnection().createStatement().executeQuery(id);
                rs.first();
                if (!b) {
                    jr.put("data", 1);
                    jr.put("user", rs.getString(1));
                } else {
                    jr.put("data", 2);
                }
            } else {
                jr.put("data", 0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr.toString();

    }
    
    
    
   
    
    
    

    @WebMethod(operationName = "getCats")
    public String getCats() {
        JSONArray jr = new JSONArray();

        try {

            String sql = ("SELECT catagory FROM main_catagory where status = 1");

            ResultSet rs = DBConnect.getConnection().createStatement().executeQuery(sql);

            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("names", rs.getString(1));
                jr.put(jo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr.toString();

    }
    
    
    
    
    
    
    
    

    @WebMethod(operationName = "getSubCats")
    public String getSubCats() {
        JSONArray jr = new JSONArray();

        try {

            String sql = ("SELECT catagory FROM sub_catagory where status = 1");

            ResultSet rs = DBConnect.getConnection().createStatement().executeQuery(sql);

            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("names", rs.getString(1));
                jr.put(jo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr.toString();

    }
    
    
    
    
    
    
    

    @WebMethod(operationName = "addToCart")
    public String addToCart(@WebParam(name = "email") String email, @WebParam(name = "price") String price, @WebParam(name = "content") String content, @WebParam(name = "title") String title,
            @WebParam(name = "adtype") String ad_type_id, @WebParam(name = "phone") String phone,
            @WebParam(name = "mcat") String main_category_id, @WebParam(name = "scat") String sub_category_id,
            @WebParam(name = "district") String district_id, @WebParam(name = "status") String status, @WebParam(name = "user") String user_id) {
        JSONObject jr = new JSONObject();
        
        int show = 0;
        if ("1".equals(ad_type_id)) {
            show=1;
        }

        try {

            System.out.println("user id  ====================================== " + user_id);

            Date date = new Date();

            String sql = "INSERT INTO advert(title, content,  district_id, user_id, main_catagory_id, ad_type_id, sub_catagory_id, status, price, phone, paid, email)"
                    + "VALUES('" + title + "','" + content + "',"
                    + "(select id from district where district ='" + district_id + "'),'" + user_id + "',"
                    + "(select id from main_catagory where catagory = '" + main_category_id + "'),'" + ad_type_id + "',"
                    + "(select id from sub_catagory where catagory = '" + sub_category_id + "'),'"+show+"','" + price + "','" + phone + "','0','" + email + "')";

            boolean b = DBConnect.getConnection().createStatement().execute(sql);

            String id = ("SELECT max(id) from advert where user_id='" + user_id + "'");

            ResultSet rs = DBConnect.getConnection().createStatement().executeQuery(id);
            rs.first();
            if (!b) {
                System.out.println("hhhhhhhhhhhhhhhhhhh " + sql);
                jr.put("data", 1);
                jr.put("id", rs.getString(1));

            } else {
                jr.put("data", 2);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jr.toString();

    }
    
    
    
    
    
  

}
