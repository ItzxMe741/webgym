package Servlet;


public class UserAccount {
 
 private String username;
 private String email;
 private String password;
 private int admin;
 private int libMan;

    public UserAccount(){
         super();
    }
    

    public UserAccount(String username, String email, String password, int admin, int libMan) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.admin = admin;
        this.libMan = libMan;
    }
 
   public UserAccount(String username, String email, String password){
        this.username = username;
        this.email = email;
        this.password = password;
    }
 
 public UserAccount(String username, String password){
        this.username=username; 
        this.password=password;
    }
 
 public UserAccount(UserAccount us){
        this.username=us.username;
        this.username=us.username;
        this.password=us.password;
    }
 
  public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getLibMan() {
        return libMan;
    }

    public void setLibMan(int libMan) {
        this.libMan = libMan;
    }


    


}
