/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import java.io.IOException;
import model.Iconstant;
import model.UserGoogle;

/**
 *
 * @author NhanNQT
 */
public class GoogleLoginDAO {

    /**
     * Hàm lấy accessToken sau khi nhận code AuthGrant
     *
     * @param code // nhận bằng parameter bên servlet
     * @return accessToken
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN) // Iconstant chứa biến config cho dự án
                .bodyForm( // gửi yêu cầu bằng form để thêm các trường dữ iệu client_id, client_secret....
                        Form.form()
                                .add("client_id", Iconstant.GOOGLE_CLIENT_ID) // lấy trong console gg
                                .add("client_secret", Iconstant.GOOGLE_CLIENT_SECRET) // lấy trong console gg
                                .add("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI) // đường dẫn trả về
                                .add("code", code) // mã lấy từ parameter trong /login servlet
                                .add("grant_type", Iconstant.GOOGLE_GRANT_TYPE) // phương thức cấp quyền truy cập
                                .build()
                )
                .execute().returnContent().asString(); // excute và trả về thông tin bằng chuỗi

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class); // chuyển response thành JsonObject
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", ""); // lấy accessToken
        return accessToken;
    }

    /**
     * Hàm lấy thông tin của người dùng
     * @param accessToken đảm bảo yêu cầu đc xác thực
     * @return
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken; // dẫn tới API của gg để lấy thông tin ng dùng 
        String response = Request.Get(link).execute().returnContent().asString(); // nhận phản hồi từ gg
            UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class); // chuyển đổi thông tin thônh UserGoogle
        return googlePojo;
    }
}
