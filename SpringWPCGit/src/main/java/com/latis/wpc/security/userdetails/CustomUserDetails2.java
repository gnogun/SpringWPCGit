package com.latis.wpc.security.userdetails;
 
import java.security.Provider;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
 
public class CustomUserDetails2 implements UserDetails {
 
    private static final long serialVersionUID = -4450269958885980297L;
    private String username;
    private String password;
    private String manageAuth;
    
	public CustomUserDetails2(String userName, String password, String manageAuth)
    {
        this.username = userName;
        this.password = password;
        this.manageAuth = manageAuth;
    }
     
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
    	
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        
        authorities.add(new SimpleGrantedAuthority(this.manageAuth));
         
        return authorities;
    }
    
  
    @Override
    public String getPassword() {
        return password;
    }
  
    @Override
    public String getUsername() {
        return username;
    }
  
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
  
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
  
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
  
    @Override
    public boolean isEnabled() {
        return true;
    }

	public String getManageAuth() {
		return manageAuth;
	}
	

	
//	public String getSalt() {
//		return salt;
//	}
//
//	public void setSalt(String salt) {
//		this.salt = salt;
//	}

    
 }