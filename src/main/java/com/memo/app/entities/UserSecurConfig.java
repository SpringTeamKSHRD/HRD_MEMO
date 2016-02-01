package com.memo.app.entities;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserSecurConfig implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String username;
	private String password;
	private List<UserRole> roles;
	private boolean accountNonExpired = true;
    private boolean accountNonLocked = true;
    private boolean credentialsNonExpired = true;
    private boolean enabled = true;
    
    public UserSecurConfig(){}
    public UserSecurConfig(int id, String username){
    	this.id = id;
    	this.username = username;
    }    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<UserRole> getRoles() {
		return roles;
	}
	public void setRoles(List<UserRole> roles) {
		this.roles = roles;
	}
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}
	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}
	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	//for comparing instance of Custom Userdetails
	//when using maximum sessions
    /**
	 * Returns {@code true} if the supplied object is a {@code User} instance with the
	 * same {@code username} value.
	 * <p>
	 * In other words, the objects are equal if they have the same username, representing the
	 * same principal.
	 */
	@Override
    public boolean equals(Object o) {
        if (o instanceof UserSecurConfig) {
        	System.out.println(username);
            return username.equals(((UserSecurConfig) o).username);
        }
        return false;
    }
	
    /**
     * Returns the hashcode of the {@code username}.
     */
    @Override
    public int hashCode() {
        return username.hashCode();
    }
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", roles=" + roles + ", accountNonExpired="
				+ accountNonExpired + ", accountNonLocked=" + accountNonLocked
				+ ", credentialsNonExpired=" + credentialsNonExpired
				+ ", enabled=" + enabled + "]";
	}
}


