/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.UnsupportedEncodingException;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.mail.*;
import javax.mail.internet.*;

import models.*;

/**
 *
 * @author duchi
 */
public class DAO extends DBHelper {

    private PreparedStatement st;
    private ResultSet rs;
    private String sql;

    public ArrayList<Product> get_product_list() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id, p.category_id, p.status, p.created_at, p.upload_by, p.rate, pd.name, pd.detail, pd.quantity, pd.price, pd.image, pd.updated_at, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Product_detail pd ON p.product_id = pd.product_id "
                + "JOIN Category c ON p.category_id = c.category_id ";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");
                Date createdAt = rs.getDate("created_at");
                int uploadBy = rs.getInt("upload_by");
                int rate = rs.getInt("rate");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                Date updatedAt = rs.getDate("updated_at");
                String category_name = rs.getString("category_name");
                if (quantity > 0 && status == 1) {
                    Product product = new Product(productId, categoryId, status, createdAt, uploadBy, rate, name, detail, quantity, price, image, updatedAt, category_name);
                    list.add(product);
                }
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public ArrayList<Product> get_product_list_admin() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id, p.category_id, p.status, p.created_at, p.upload_by, p.rate, pd.name, pd.detail, pd.quantity, pd.price, pd.image, pd.updated_at, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Product_detail pd ON p.product_id = pd.product_id "
                + "JOIN Category c ON p.category_id = c.category_id ";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");
                Date createdAt = rs.getDate("created_at");
                int uploadBy = rs.getInt("upload_by");
                int rate = rs.getInt("rate");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                Date updatedAt = rs.getDate("updated_at");
                String category_name = rs.getString("category_name");

                Product product = new Product(productId, categoryId, status, createdAt, uploadBy, rate, name, detail, quantity, price, image, updatedAt, category_name);
                list.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> get_product_list_by_search(String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id, p.category_id, p.status, p.created_at, p.upload_by, p.rate, pd.name, pd.detail, pd.quantity, pd.price, pd.image, pd.updated_at, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Product_detail pd ON p.product_id = pd.product_id "
                + "JOIN Category c ON p.category_id = c.category_id ";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");
                Date createdAt = rs.getDate("created_at");
                int uploadBy = rs.getInt("upload_by");
                int rate = rs.getInt("rate");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                Date updatedAt = rs.getDate("updated_at");
                String category_name = rs.getString("category_name");
                if (quantity > 0 && status == 1 && name.toLowerCase().contains(search.toLowerCase())) {
                    Product product = new Product(productId, categoryId, status, createdAt, uploadBy, rate, name, detail, quantity, price, image, updatedAt, category_name);
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Category> get_category_list() {
        ArrayList<Category> list = new ArrayList<>();

        sql = "SELECT * FROM Category";

        try {

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int category_id = rs.getInt("category_id");
                String name = rs.getString("name");
                boolean status = rs.getBoolean("status");
                Date create = rs.getDate("created_at");
                Date update = rs.getDate("updated_at");
                Category entry = new Category(category_id, name, status, create, update);
                list.add(entry);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public boolean add_category(Category category) {

        sql = "INSERT INTO Category (name, status, created_at, updated_at) "
                + "VALUES (?, ?, ?, ?)";

        try {
            st = connection.prepareStatement(sql);

            st.setString(1, category.getName());
            st.setBoolean(2, category.getStatus());
            st.setDate(3, new Date(category.getCreatedAt().getTime()));
            st.setDate(4, new Date(category.getUpdatedAt().getTime()));

            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
        }

        return false;
    }

    public ArrayList<Role> get_role_list() {
        ArrayList<Role> list = new ArrayList<>();

        sql = "SELECT * FROM Role";

        try {

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int role_level = rs.getInt("role_level");
                String role_name = rs.getString("role_name");
                Role role = new Role(role_level, role_name);
                list.add(role);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public boolean add_role(Role role) {

        sql = "INSERT INTO Role (role_level, role_name) "
                + "VALUES (?, ?)";

        try {
            st = connection.prepareStatement(sql);

            st.setInt(1, role.getRoleLevel());
            st.setString(2, role.getRoleName());

            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
        }

        return false;
    }

    public Account login(String txtUsername, String txtPassword) {
        Account account = new Account();
        sql = "SELECT * "
                + "FROM Account "
                + "WHERE username = ? "
                + "AND password = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setString(1, txtUsername);
            st.setString(2, txtPassword);
            rs = st.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                Date createdAt = rs.getDate("created_at");
                int status = rs.getInt("status");

                account = new Account(accountId, username, password, name, address, email, phone, role, createdAt, status);
                return account;
            }

        } catch (SQLException e) {
        }

        return null;
    }

    public ArrayList<Account> get_account_list() {
        ArrayList<Account> list = new ArrayList<>();
        sql = "SELECT * FROM Account";

        try {

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                Date createdAt = rs.getDate("created_at");
                int status = rs.getInt("status");

                Account account = new Account(accountId, username, password, name, address, email, phone, role, createdAt, status);
                list.add(account);
            }

        } catch (SQLException e) {
        }

        return list;
    }

    public ArrayList<Account> get_seller_list() {
        ArrayList<Account> list = new ArrayList<>();
        sql = "SELECT * FROM Account "
                + "WHERE role >= 3 ";

        try {

            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                Date createdAt = rs.getDate("created_at");
                int status = rs.getInt("status");

                Account account = new Account(accountId, username, password, name, address, email, phone, role, createdAt, status);
                list.add(account);
            }

        } catch (SQLException e) {
        }

        return list;
    }

    public boolean register(int id, String username, String password, String name, String address, String email, String phone, int role, Date date, int status) {
        String sql = "INSERT INTO Account (account_id, username, password, name, address, email, phone, role, created_at, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        java.sql.Date newDate = new java.sql.Date(date.getTime());
        try {
            st = connection.prepareStatement(sql);

            st.setInt(1, id);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, name);
            st.setString(5, address);
            st.setString(6, email);
            st.setString(7, phone);
            st.setInt(8, role);
            st.setDate(9, newDate);
            st.setInt(10, status);

            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public String Send(String user_email) throws UnsupportedEncodingException {

        // Thông tin tài khoản email
        String username = "duchinh03061@gmail.com";
        String password = "ygdiuklubcwheyur";

        // Cấu hình SMTP server và thông tin cổng
        String host = "smtp.gmail.com";
        int port = 587;

        // Cấu hình các thuộc tính kết nối
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        // Tạo đối tượng Session để xác thực truy cập SMTP server
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Thiết lập thông tin người gửi
            message.setFrom(new InternetAddress(username));

            // Thiết lập thông tin người nhận
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(user_email));

            // Thiết lập tiêu đề email
            message.setSubject("Account Verification FROM PRJ301 Assignment");

            // Tạo nội dung HTML cho email
            String originalLink = "http://localhost:8080/PRJ301-Assignment/Verify";

            // Mã hóa email
            String encodedEmail = Base64.getUrlEncoder().encodeToString(user_email.getBytes(StandardCharsets.UTF_8));

            // Tạo đường dẫn hoàn chỉnh chứa phần mã hóa
            String link = originalLink + "?encodedEmail=" + encodedEmail;

            String content = "<html>"
                    + "<body>"
                    + "<p>This is an automatic email for account activation.</p>"
                    + "<p>Please click the link below to verify your account.</p>"
                    + "<p>Link: <a href=\"" + link + "\">Verify Account</a></p>"
                    + "<p>or copy this: " + link + " </p>"
                    + "</body>"
                    + "</html>";

            // Thiết lập nội dung email dưới dạng HTML với encoding UTF-8
            message.setContent(content, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);
            return "Email has been sent successfully";
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "Email sent failed ";
    }

    public boolean verify(String email) {

        sql = "UPDATE Account "
                + "SET status = 1 "
                + "WHERE email = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean updateInfor(int id, String name, String email, String phone, String address) {

        sql = "UPDATE Account SET name = ?, email = ?, phone = ?, address = ? WHERE account_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.setInt(5, id);

            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public Account get_account_by_id(int id) {
        Account account = new Account();
        sql = "SELECT * "
                + "FROM Account "
                + "WHERE account_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                int role = rs.getInt("role");
                Date createdAt = rs.getDate("created_at");
                int status = rs.getInt("status");

                account = new Account(accountId, username, password, name, address, email, phone, role, createdAt, status);
                return account;
            }

        } catch (SQLException e) {
        }

        return null;
    }

    public boolean change_password(int id, String password) {

        sql = "UPDATE Account "
                + "SET password = ? "
                + "WHERE account_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, id);
            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public ArrayList<Product> get_product_list_by_id(int id) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id, p.category_id, p.status, p.created_at, p.upload_by, p.rate, pd.name, pd.detail, pd.quantity, pd.price, pd.image, pd.updated_at, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Product_detail pd ON p.product_id = pd.product_id "
                + "JOIN Category c ON p.category_id = c.category_id "
                + "WHERE p.upload_by = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");
                Date createdAt = rs.getDate("created_at");
                int uploadBy = rs.getInt("upload_by");
                int rate = rs.getInt("rate");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                Date updatedAt = rs.getDate("updated_at");
                String category_name = rs.getString("category_name");
                Product product = new Product(productId, categoryId, status, createdAt, uploadBy, rate, name, detail, quantity, price, image, updatedAt, category_name);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product get_product_by_id(int id) {
        Product product = new Product();
        String sql = "SELECT p.product_id, p.category_id, p.status, p.created_at, p.upload_by, p.rate, pd.name, pd.detail, pd.quantity, pd.price, pd.image, pd.updated_at, c.name AS category_name "
                + "FROM Product p "
                + "JOIN Product_detail pd ON p.product_id = pd.product_id "
                + "JOIN Category c ON p.category_id = c.category_id "
                + "WHERE p.product_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                int status = rs.getInt("status");
                Date createdAt = rs.getDate("created_at");
                int uploadBy = rs.getInt("upload_by");
                int rate = rs.getInt("rate");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                Date updatedAt = rs.getDate("updated_at");
                String category_name = rs.getString("category_name");
                product = new Product(productId, categoryId, status, createdAt, uploadBy, rate, name, detail, quantity, price, image, updatedAt, category_name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public ArrayList<Order> get_order_list() {
        ArrayList<Order> list = new ArrayList<>();
        sql = "SELECT * FROM [Order]";

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(("order_id"));
                int accid = rs.getInt("account_id");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                Date create = rs.getDate("created_at");
                Date update = rs.getDate("updated_at");
                Order entry = new Order(id, accid, total, status, create, update);
                list.add(entry);
            }
        } catch (SQLException e) {
            // Xử lý exception
        }

        return list;
    }

    public ArrayList<Order> get_order_list_by_id(int account_id) {
        ArrayList<Order> list = new ArrayList<>();
        sql = "SELECT * FROM [Order] "
                + "WHERE account_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(("order_id"));
                int accid = rs.getInt("account_id");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                Date create = rs.getDate("created_at");
                Date update = rs.getDate("updated_at");
                Order entry = new Order(id, accid, total, status, create, update);
                list.add(entry);
            }
        } catch (SQLException e) {
            // Xử lý exception
        }

        return list;
    }

    public Order get_order_by_id(int order_id) {
        Order order = new Order();
        sql = "SELECT * FROM [Order] "
                + "WHERE order_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(("order_id"));
                int accid = rs.getInt("account_id");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                Date create = rs.getDate("created_at");
                Date update = rs.getDate("updated_at");
                order = new Order(id, accid, total, status, create, update);

            }
        } catch (SQLException e) {
            // Xử lý exception
        }

        return order;
    }

    public ArrayList<OrderDetail> get_order_detail_list() {
        ArrayList<OrderDetail> list = new ArrayList<>();
        sql = "SELECT * FROM Order_detail";

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(("order_detail_id"));
                int oid = rs.getInt("order_id");
                int pid = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Double amount = rs.getDouble("amount");
                Double price = rs.getDouble("price");
                OrderDetail entry = new OrderDetail(id, oid, pid, quantity, amount, price);
                list.add(entry);
            }
        } catch (SQLException e) {
            // Xử lý exception
        }

        return list;
    }

    public ArrayList<OrderDetail> get_order_detail_list(int account_id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        sql = "SELECT * FROM Order_detail "
                + "WHERE order_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(("order_detail_id"));
                int oid = rs.getInt("order_id");
                int pid = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Double amount = rs.getDouble("amount");
                Double price = rs.getDouble("price");
                OrderDetail entry = new OrderDetail(id, oid, pid, quantity, amount, price);
                list.add(entry);
            }
        } catch (SQLException e) {
            // Xử lý exception
        }

        return list;
    }

    public boolean add_order(int order_id, int account_id, float total, int status, Date create_date, Date update_date) {

        String sql = "INSERT INTO [Order] (order_id, account_id, total, status, created_at, updated_at) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            st.setInt(2, account_id);
            st.setFloat(3, total);
            st.setInt(4, status);
            st.setDate(5, new java.sql.Date(create_date.getTime()));
            st.setDate(6, new java.sql.Date(update_date.getTime()));

            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
            // Xử lý exception
        }

        return false;
    }

    public boolean add_order_detail(int order_detai_id, int order_id, ArrayList<Cart> list) {

        String sql = "INSERT INTO Order_detail (order_detail_id,order_id, product_id, quantity, amount, price) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            st = connection.prepareStatement(sql);

            for (Cart cart : list) {
                st.setInt(1, order_detai_id++);
                st.setInt(2, order_id);
                st.setInt(3, cart.getProductId());
                st.setInt(4, cart.getQuantity());
                st.setDouble(5, cart.getQuantity() * cart.getPrice());
                st.setDouble(6, cart.getPrice());
                st.addBatch();
            }

            st.executeBatch();
            return true;

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean remove_order_by_id(int order_id) {

        sql = "UPDATE [Order] "
                + "SET status = ? "
                + "WHERE order_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, 4);
            st.setInt(2, order_id);
            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean recieve_order_by_id(int order_id) {

        sql = "UPDATE [Order] "
                + "SET status = ? "
                + "WHERE order_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, 3);
            st.setInt(2, order_id);
            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean cancel_order_by_id(int order_id) {

        sql = "UPDATE [Order] "
                + "SET status = ? "
                + "WHERE order_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, 0);
            st.setInt(2, order_id);
            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public ArrayList<Comment> get_comment_list() {
        ArrayList<Comment> list = new ArrayList<>();

        sql = "SELECT * FROM Comment";

        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int account_id = rs.getInt("account_id");
                int comment_id = rs.getInt("comment_id");
                String comment = rs.getString("comment");
                int rate = rs.getInt("rate");
                boolean status = rs.getBoolean("status");
                Date date = rs.getDate("created_at");

                Comment entry = new Comment(product_id, account_id, comment_id, comment, rate, status, date);
                list.add(entry);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public ArrayList<Comment> get_comment_list_by_product_id(int id) {
        ArrayList<Comment> list = new ArrayList<>();

        sql = "SELECT * FROM Comment "
                + "WHERE product_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int account_id = rs.getInt("account_id");
                int comment_id = rs.getInt("comment_id");
                String comment = rs.getString("comment");
                int rate = rs.getInt("rate");
                boolean status = rs.getBoolean("status");
                Date date = rs.getDate("created_at");

                Comment entry = new Comment(product_id, account_id, comment_id, comment, rate, status, date);
                list.add(entry);

            }

        } catch (SQLException e) {
        }

        return list;
    }

    public boolean update_product_after_order(ArrayList<Cart> cart_list) {

        sql = "UPDATE Product_Detail "
                + "SET quantity = quantity - ? "
                + "WHERE product_id = ?";

        try {
            st = connection.prepareStatement(sql);

            for (Product product : cart_list) {
                int product_id = product.getProductId();
                int quantity = product.getQuantity();

                // Thực hiện cập nhật số lượng trong bảng "Product"
                st.setInt(1, quantity);
                st.setInt(2, product_id);

                int row = st.executeUpdate();

            }
            return true;
        } catch (SQLException e) {
        }

        return false;
    }

    public boolean update_product_after_comment(int product_id, int rate) {
        sql = "UPDATE Product "
                + "SET rate = (rate + ?)/2 "
                + "WHERE product_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, rate);
            st.setInt(2, product_id);

            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean add_comment(int product_id, int account_id, int comment_id, String comment, int rate, boolean status, Date date) {

        sql = "INSERT INTO Comment (product_id, account_id, comment_id, comment, rate, status, created_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            st = connection.prepareStatement(sql);
            // Đặt các giá trị vào câu lệnh SQL
            st.setInt(1, product_id);
            st.setInt(2, account_id);
            st.setInt(3, comment_id);
            st.setString(4, comment);
            st.setInt(5, rate);
            st.setBoolean(6, status);
            st.setDate(7, new java.sql.Date(date.getTime()));

            int row = st.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean update_product_by_id(int productId, String name, String detail, int quantity, float price) {

        sql = "UPDATE Product_Detail "
                + "SET name = ?, detail = ?, quantity = ?, price = ?, updated_at = ? "
                + "WHERE product_id = ?";

        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, detail);
            st.setInt(3, quantity);
            st.setDouble(4, price);

            java.util.Date currentDate = new java.util.Date();
            java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(currentDate.getTime());
            st.setTimestamp(5, sqlTimestamp);

            st.setInt(6, productId);

            int row = st.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
        }

        return false;
    }

    public boolean remove_product_by_id(int productId) {
        String sqlDeleteProduct = "DELETE FROM Product WHERE product_id = ?";
        String sqlDeleteProductDetail = "DELETE FROM Product_Detail WHERE product_id = ?";

        try {
            // Delete from the Product table
            PreparedStatement stDeleteProduct = connection.prepareStatement(sqlDeleteProduct);
            stDeleteProduct.setInt(1, productId);

            int rowsAffectedProduct = stDeleteProduct.executeUpdate();

            // Delete from the Product_Detail table
            PreparedStatement stDeleteProductDetail = connection.prepareStatement(sqlDeleteProductDetail);
            stDeleteProductDetail.setInt(1, productId);

            int rowsAffectedProductDetail = stDeleteProductDetail.executeUpdate();

            if (rowsAffectedProduct > 0 && rowsAffectedProductDetail > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // It's better to print the exception or handle it properly.
        }

        return false;
    }

    public boolean upload_product(int accountId, int productId, int categoryId, boolean status, int uploadBy,
            String name, String detail, float price, String image) {
        sql = "INSERT INTO Product (product_id, category_id, status, created_at, upload_by, rate) VALUES (?, ?, ?, ?, ?, ?)";

        String sql1 = "INSERT INTO Product_detail (product_id, name, detail, quantity, price, image, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";

        java.util.Date currentDate = new java.util.Date();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(currentDate.getTime());

        try {

            // Insert into Product table
            st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, categoryId);
            st.setBoolean(3, status);
            st.setTimestamp(4, sqlTimestamp);
            st.setInt(5, accountId);
            st.setInt(6, 0);

            int row1 = st.executeUpdate();

            // Insert into Product_Detail table
            st = connection.prepareStatement(sql1);
            st.setInt(1, productId);
            st.setString(2, name);
            st.setString(3, detail);
            st.setInt(4, 1);
            st.setDouble(5, price);
            st.setString(6, image);
            st.setTimestamp(7, sqlTimestamp);

            int row2 = st.executeUpdate();

            return (row1 > 0 && row2 > 0); // Check if both insertions were successful
        } catch (SQLException e) {
        }

        return false;
    }
}
