package com.example.demo.controller;

import com.example.demo.entity.*;

import java.io.File;
import java.sql.Timestamp;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/*
import com.example.demo.model.AddtoCart;*/
import com.example.demo.repository.*;
import com.example.demo.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@SessionAttributes("email")
public class WebController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductsService productsService;
    @Autowired
    private ProductPortfolioService productPortfolioService;
    @Autowired
    ProductsRepository productsRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    AccountRepository accountRepository;

    @RequestMapping("/")
    public String getAllProducts(Model model) {
        model.addAttribute("ProductList", productsService.getProductsEntities());
        List<ProductPortfolioEntity> productPortfolios = productPortfolioService.ProductPortfolioEntityAll();
        model.addAttribute("productPortfolios", productPortfolios);
        return "home";
    }

    @RequestMapping("/manager")
    public String getPlayProject() {
        return "index";
    }

    @RequestMapping("/design")
    public String getdesign() {
        return "desgin";
    }


    @RequestMapping(value = {"/detail/{id}"})
    public String getIdProducts(@PathVariable int id, ModelMap modelMap) {
        ProductsEntity productsEntity = productsService.getfindById(id);

        modelMap.addAttribute("productsEntity", productsEntity);
        modelMap.addAttribute("ProductList1", productsService.getIdProductsPortfolio(1));
        modelMap.addAttribute("ProductList2", productsService.getIdProductsPortfolio(2));
        modelMap.addAttribute("ProductList3", productsService.getIdProductsPortfolio(3));
        modelMap.addAttribute("ProductList4", productsService.getIdProductsPortfolio(4));

        return "website";
    }


    @RequestMapping("/searchproducts")
    public String getAllProductssearch(Model model, @Param("keyword") String keyword, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<ProductsEntity> productsEntities = productsService.listAll(keyword);
        PagedListHolder pagedListHolder = new PagedListHolder(productsEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("keyword", keyword);
        return "searchproducts";
    }


    @RequestMapping("/cart")
    public String getCart(Model model) {

        return "cart";
    }


    @RequestMapping("/invoice")
    public String getInvoice() {
        return "invoice";
    }


    @RequestMapping("/sendmail")
    public String sendmail(AccountEntity accountEntity) throws MessagingException {
        sendFile(accountEntity);
        return "redirect:contacts";
    }

    public static void sendFile(AccountEntity accountEntity) throws AddressException, MessagingException {
        Properties mailServerProperties;
        Session getMailSession;
        MimeMessage mailMessage;


        // Step1: setup Mail Server
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");

        // Step2: get Mail Session
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        mailMessage = new MimeMessage(getMailSession);

        mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(accountEntity.getEmail()));
        //
        //Replace abc with the recipient's address

        // You can choose CC, BCC
//    generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Address cc gmail
        mailMessage.setSubject("A PRODUCT OF APPLE");

        //
        //Create a message sending section
        BodyPart messagePart = new MimeBodyPart();
        messagePart.setText("Hello Brother / Sister,\n" +
                "I am Quoc, from Apple Software Technology Company. My side is providing the market WEBSITE AUTOMATIC ADVERTISEMENT. I send information to you for reference.\n" +
                "Website: https://www.apple.com/\n" +
                "********************\n" +
                "Phone number: 07.6663.8883 (Mr. Quoc)\n" +
                "APQ SOFTWARE TECHNOLOGY CO., LTD\n" +
                "Address: No. K548 / 7 Dien Bien Phu, Ward Thanh Khe Dong, Thanh Khe District, Da Nang City");

        //Create file sending section

        BodyPart filePart = new MimeBodyPart();
        File file = new File("D:\\JetBrains\\TEST\\APPPPPPPPP\\application\\MailSendSale.html");
        DataSource source = new FileDataSource(file);
        filePart.setDataHandler(new DataHandler(source));
        filePart.setFileName(file.getName());


        //
        //Merge message and file to send
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messagePart);
        multipart.addBodyPart(filePart);
        mailMessage.setContent(multipart);


        // Step3: Send mail
        Transport transport = getMailSession.getTransport("smtp");

        //
        //Change your_gmail to your gmail, change your_password to your gmail password
        transport.connect("smtp.gmail.com", "mixermonz@gmail.com", "nelyipmidjlsfmlx");
        transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
        transport.close();
    }


    @RequestMapping("/user")
    public String showStudentPage(Authentication authentication, Model model) {
        String usernameLogined = authentication.getName();
//        String password = authentication.getAuthorities<>();
        AccountEntity accountEntity = accountService.getAccountByUsername(usernameLogined);
        model.addAttribute("accounts", accountEntity);
        return "wellcome";
    }


    @RequestMapping(value = "/UserRegisterAccount", method = RequestMethod.POST)
    public String registerAccount(UserEntity userEntity) throws NoSuchAlgorithmException {

        UserEntity newUserEntity = new UserEntity();
        newUserEntity.setUsername(userEntity.getUsername());
        newUserEntity.setPassword(new BCryptPasswordEncoder().encode(userEntity.getPassword()));
        List<RoleEntity> roleEntityList = new ArrayList<>();
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setName("USER");
        roleEntityList.add(roleEntity);
        newUserEntity.setEnabled(1);
        newUserEntity.setUserRoleEntities(roleEntityList);
        if (userService.isException(newUserEntity)) {
            return "redirect:/login";
        } else {
            userService.saveAccount(newUserEntity);
            userService.saveAccount(newUserEntity);
            Boolean isValidEmail = validate(userEntity.getAccountEntity().getEmail());
            if (isValidEmail) {
                AccountEntity accountEntity = new AccountEntity();
                accountEntity.setEmail(userEntity.getAccountEntity().getEmail());
                accountEntity.setPhonenumber(userEntity.getAccountEntity().getPhonenumber());
                accountEntity.setDate(new Timestamp(new Date().getTime()));
                accountEntity.setUserEntity(userService.getAccountByUsername(newUserEntity.getUsername()));
                accountService.saveAccount(accountEntity);
            }
            return "redirect:login";

        }
    }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();

    }


    public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            return convertByteToHex(messageDigest);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


    public String MD5() {
        String md5 = new String();
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : array) {
                sb.append(Integer.toHexString((b & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException ignored) {
        }
        return null;
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


    public static String getON_MD5(String data) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");

        messageDigest.update(data.getBytes());
        byte[] digest = messageDigest.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b : digest) {
            sb.append(Integer.toHexString((int) (b & 0xff)));
        }
        return sb.toString();
    }


}
