package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ProductsRepository;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "cart")
public class ControllerCart {
    @Autowired
    private ProductsService productsService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private ProductPortfolioService productPortfolioService;
    @Autowired
    private OrderDetailsService orderDetailsService;
    @Autowired
    private OrderService orderService;
    @Autowired
    ProductsRepository productsRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    AccountRepository accountRepository;


    @RequestMapping(value = "addcart/{id}", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("id") int id) {
        // Một mảng có chưa cartentity được lưu từ session với tên mycartitems
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        // nếu mảng không có giá trị nào thì sẽ tạo 1 mảng mới
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }

        // khai báo productentity gán giá trị id
        ProductsEntity productsEntity = productsService.getfindById(id);
        // giá trị trong productentity khác null
        if (productsEntity != null) {
            // thì mảng giỏ hàng là hashmap ở trên sẽ kiểm tra keyword containskey dung để kiểm tra key có tồn tại trong hấmp hay không
            // nếu không tồn tại nó sẽ trả về false , ngược lại true , tham số truyền vào của containskey là 1 object
            // thế nên bạn có thể truyền bất kì giá trị dữ liệu nào không cần thiết phải giống với kiểu dữ liệu key
            if (cartItems.containsKey(id)) {
                //sau đó item sẽ gọi Hashmap của id cartitems và
                CartEntity item = cartItems.get(id);
                // set dữ liệu sản phẩm
                item.setProductsEntity(productsEntity);
                // số lương tăng + 1 khi chạy hàm này có nghĩa khi click sản phẩm nó sẽ chạy vào hàm này
                item.setQuantity(item.getQuantity() + 1);
                // giỏ hàng có yếu tố thêm sửa với id hash map và giá trị bên trong
                cartItems.put(id, item);
            } else {
                // còn nếu hàm phía trên chạy không có cái cartitem thì cái sẽ là 1 giỏ hàng mới
                // đồng nghĩa có giỏ hàng thì thêm sản phẩm không có thì tạo cái giỏ hàng rồi thêm sản phẩm
                CartEntity item = new CartEntity();
                item.setProductsEntity(productsEntity);
                item.setQuantity(1);
                cartItems.put(id, item);
            }
        }
        // session có giá trị của 3 cái item , giá số , lương
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "/cart";
    }

    // tạo một public dữ liệu double tổng giá tiền . có mảng cartitem
    public double totalPrice(HashMap<Integer, CartEntity> cartItems) {
        // khai báo coynt = 0
        int count = 0;
// for mảng list giỏ hàng sét bằng vòng lập foreach entryset . giá trị count += ;list chứa value. sản phẩm giá tiền , và sản phẩm số lượng
        for (Map.Entry<Integer, CartEntity> list : cartItems.entrySet()) {
            count += list.getValue().getProductsEntity().getPrice() * list.getValue().getQuantity();
        }
        //trả về biến int count
        return count;
    }


    @RequestMapping(value = "sub/{id}", method = RequestMethod.GET)
    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("id") Integer id) {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        //
        session.setAttribute("myCartItems", cartItems);
        return "/cart";
    }


    @RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("id") Integer id) {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        // mảng có giá trị chỉ định id của giỏ hàng thì xóa
        if (cartItems.containsKey(id)) {
            cartItems.remove(id);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "/cart";
    }

    @RequestMapping(value = "/checkoutforms", method = RequestMethod.GET)
    public String addProducts(Model model, HttpSession session,
                              @ModelAttribute("Orders") OrderDetailsEntity orderDetailsEntity, Authentication authentication) {
        // biến mang tên username login = giá trị bảo mật chỉ vào tên
        String usernameLogined = authentication.getName();
        // account = get giá trị tên của bảo mật
        AccountEntity accountEntity = accountService.getAccountByUsername(usernameLogined);

        // trả vào form transaction nhập thông tin thanh toán
        model.addAttribute("ordersEntity", new OrdersEntity());
        // trả giữ liệu của tài khoản
        model.addAttribute("accounts", accountEntity);

        // trả về view orders
        return "orders";
    }


    @RequestMapping(value = "/Transaction", method = RequestMethod.GET)
    public String viewCheckout(ModelMap mm, HttpSession session, @ModelAttribute("transactionEntity")
            OrdersEntity ordersEntity) throws NoSuchAlgorithmException {
        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
        OrdersEntity ordersEntity1 = orderService.newTransaction(ordersEntity);
        ordersEntity1.setTransactiondate(new Timestamp(new Date().getTime()));
        ordersEntity1.setTransactionstatus(true);
        ordersEntity1.setSecurity(getSHAHash(ordersEntity.getSecurity()));
        for (Map.Entry<Integer, CartEntity> entry : cartItems.entrySet()) {
            OrderDetailsEntity orderDetailsEntity = new OrderDetailsEntity();
            orderDetailsEntity.setOrdersEntity(ordersEntity1);
            orderDetailsEntity.setProductsEntity(entry.getValue().getProductsEntity());
            orderDetailsEntity.setTotal(entry.getValue().getProductsEntity().getPrice());
            orderDetailsEntity.setSale(entry.getValue().getProductsEntity().getSale());
            orderDetailsEntity.setQuantity(entry.getValue().getQuantity());
/*
            receiptItem.setReceiptItemStatus(true);
*/
            orderDetailsService.newOrders(orderDetailsEntity);
        }
        session.removeAttribute("myCartNum");
        /* session.getAttribute("myCartNum");*/
        session.removeAttribute("myCartItems");
        return "shipping";
    }

    public static String getSHAHash(String input) throws NoSuchAlgorithmException {

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] messageDigest = md.digest(input.getBytes());
            return convertByteToHex(messageDigest);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String convertByteToHex(byte[] data) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < data.length; i++) {
            sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }


}


