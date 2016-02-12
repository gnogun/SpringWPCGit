package com.latis.wpc.service.security;

import java.util.HashMap;






import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.latis.wpc.dto.user.WpcUser;
import com.latis.wpc.mapper.WpcMapper;
import com.latis.wpc.security.userdetails.CustomUserDetails;
import com.latis.wpc.security.userdetails.CustomUserDetails2;


public class UserService implements UserDetailsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

//	 @Autowired
//	 private StandardPasswordEncoder encoder;
	
//	@Autowired 
//	private SaltSource saltSource;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub

//		System.out.println("!!!!!!!!!!"+encoder.encodePassword("gno", saltSource));
		
		
		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
		
		HashMap<String, String> userMap = new HashMap<String, String>();
		
		userMap.put("id", username);
		
		WpcUser user = mapper.getUser(userMap);
		
		if (user != null) {
			
//			return new CustomUserDetails(username, user.getPwd(), "ROLE_" + user.getManage_auth(), saltSource);
			return new CustomUserDetails2(username, user.getPwd(), "ROLE_" + user.getManage_auth());
		} else {
			throw new AuthenticationCredentialsNotFoundException("");
		}
	}
	
	
}
