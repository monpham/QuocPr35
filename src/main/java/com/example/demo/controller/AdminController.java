package com.example.demo.controller;

import com.example.demo.entity.*;

import java.sql.Timestamp;
import java.util.*;

import com.example.demo.repository.*;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.*;


@Controller
@SessionAttributes("email")
public class AdminController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductsService productsService;
    @Autowired
    private ProductPortfolioService productPortfolioService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailsService orderDetailsService;
    @Autowired
    ProductsRepository productsRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    AccountRepository accountRepository;


    @RequestMapping("/orders")
    public String getOrders(Model model, @Param("keyword") String keyword, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<OrdersEntity> transactionEntities = orderService.listAll(keyword);
        PagedListHolder pagedListHolder = new PagedListHolder(transactionEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("keyword", keyword);
        return "ordertest";
    }


    @RequestMapping(value = {"/viewdetails/{id}/{transactionname}"})
    public String getViewdetails(ModelMap model, @PathVariable int id,
                                 @PathVariable String transactionname) {
        List<OrderDetailsEntity> ordersEntities = orderDetailsService.getIDTransaction(id);
        List<OrdersEntity> transactionsEntities = orderService.transactionEntities();
        model.addAttribute("transactionsEntities", transactionsEntities);
        model.addAttribute("transactionname", transactionname);
        model.addAttribute("ordersEntities", ordersEntities);
        return "viewdetails";
    }

    @RequestMapping(value = {"/invoices"})
    public String getinvoice(ModelMap model, @RequestParam("id") int id) {
        List<OrderDetailsEntity> ordersEntities = orderDetailsService.getIDTransaction(id);
        OrdersEntity ordersEntity = orderService.getfintbyTransaction(id);
        model.addAttribute("ordersEntity", ordersEntity);
        model.addAttribute("ordersEntities", ordersEntities);
        return "invoice";
    }

    @RequestMapping("/admin")
    public String getAllAccount(Model model, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<AccountEntity> accountEntities = accountService.getUsersAlldest();
        PagedListHolder pagedListHolder = new PagedListHolder(accountEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "dashboard";
    }


    @RequestMapping(value = "/tables")
    public String showTeacherPage(Model model, @Param("keyword") String keyword, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<AccountEntity> accountEntities = accountService.listAll(keyword);
        PagedListHolder pagedListHolder = new PagedListHolder(accountEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(7);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("keyword", keyword);
        return "tables";
    }

    @RequestMapping("/contacts")
    public String getContact(Model model, @Param("keyword") String keyword, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<AccountEntity> accountEntities = accountService.listAll(keyword);
        PagedListHolder pagedListHolder = new PagedListHolder(accountEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(7);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("keyword", keyword);
        model.addAttribute("account", new UserEntity());


        return "contacts";
    }

    @RequestMapping(value = "/AccountAdminAdd", method = RequestMethod.POST)
    public String registerAccountAdminAdd(UserEntity userEntity, Model model) {
        UserEntity newUserEntity = new UserEntity();
        newUserEntity.setUsername(userEntity.getUsername());
        newUserEntity.setPassword(new BCryptPasswordEncoder().encode(userEntity.getPassword()));
        List<RoleEntity> roleEntityList = new ArrayList<>();
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setName("MANAGER");
        roleEntityList.add(roleEntity);
        newUserEntity.setEnabled(1);
        newUserEntity.setUserRoleEntities(roleEntityList);
        if (userService.isException(newUserEntity)) {
            return "redirect:contacts";
        } else {
            userService.saveAccount(newUserEntity);
            userService.saveAccount(newUserEntity);
            AccountEntity accountEntity = new AccountEntity();
            accountEntity.setEmail(userEntity.getAccountEntity().getEmail());
            accountEntity.setDate(new Timestamp(new Date().getTime()));
            accountEntity.setPhonenumber(userEntity.getAccountEntity().getPhonenumber());
            accountEntity.setUserEntity(userService.getAccountByUsername(newUserEntity.getUsername()));
            accountService.saveAccount(accountEntity);
        }
        return "redirect:contacts";
    }

    @RequestMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id) {
        userRepository.deleteById(id);
        return "delete";
    }

    @RequestMapping("/calendar")
    public String getCalendar() {
        return "pages-calendar";
    }

    @RequestMapping("/sweet")
    public String getCombonensweet() {
        return "componentsweet";
    }

    @RequestMapping("/maps")
    public String GetMap() {
        return "map";
    }

    @RequestMapping("/factory")
    public String get() {
        return "factory";
    }


    @RequestMapping("/productsadmin")
    public String getAllProductAdmin(Model model, @Param("keyword") String keyword, @RequestParam(name = "p", defaultValue = "0") int page) {
        List<ProductsEntity> productsEntities = productsService.listAll(keyword);
        PagedListHolder pagedListHolder = new PagedListHolder(productsEntities);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(7);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("keyword", keyword);
        return "productsadmin";
    }

    @RequestMapping(value = "/addProducts")
    public String addProducts(Model model) {
        model.addAttribute("product", new ProductsEntity());
        model.addAttribute("productPortfolios", getProductPoftfoliolist());
        return "newproducts";
    }

    @RequestMapping(value = "/editProducts")
    public String editProducts(@RequestParam("id") int id, Model model) {
        ProductsEntity productsEntity = productsService.editProducts(id);
        model.addAttribute("ProductList", productsService.getProductsEntities());
        model.addAttribute("product", productsEntity);
        model.addAttribute("productPortfolios", getProductPoftfoliolist());
        model.addAttribute("type", "update");
        return "newproducts";
    }

    @RequestMapping(value = "/newProducts")
    public String newProducts(ProductsEntity productsEntity) {
        productsService.newProducts(productsEntity);
        return "redirect:productsadmin";
    }

    @RequestMapping("/deleteproduct/{id}")
    public String deleteProducts(@PathVariable Integer id) {
        productsRepository.deleteById(id);
        return "deleteproducts";
    }

    private Map<Integer, String> getProductPoftfoliolist() {
        List<ProductPortfolioEntity> productPortfolioEntities = productPortfolioService.ProductPortfolioEntityAll();
        Map<Integer, String> productList = new HashMap<>();
        for (ProductPortfolioEntity p : productPortfolioEntities) {
            productList.put(p.getId(), p.getPortfolio());
        }
        return productList;
    }

}
