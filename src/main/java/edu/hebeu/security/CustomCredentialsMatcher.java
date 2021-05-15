
package edu.hebeu.security;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;



/**
 * @Title: 密码匹配记录
 * @author: Administrator
 * @Desc: 如果登陆不对，则记录，五次后提示
 * @date: 2019年5月20日 下午4:44:12
 */
public class CustomCredentialsMatcher extends HashedCredentialsMatcher {
	private Cache<String,AtomicInteger> passwordRetryCache;

	/**
	 * 
	 */
	public CustomCredentialsMatcher(CacheManager cacheManager) {
		passwordRetryCache = cacheManager.getCache("passwordRetryCache");  
	}

	
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token,
            AuthenticationInfo info) {
        String loginName = (String) token.getPrincipal();
        AtomicInteger retryCount = passwordRetryCache.get(loginName);
        if(retryCount==null){
            retryCount = new AtomicInteger(0);           
        }
        //将缓存记录的登录次数加1

        retryCount.incrementAndGet();
        if(retryCount.get()>5){
            throw new ExcessiveAttemptsException();
        }
        
        passwordRetryCache.put(loginName, retryCount);
        boolean matchs = super.doCredentialsMatch(token, info);
        if(matchs){
            passwordRetryCache.remove(loginName);
        }
        return super.doCredentialsMatch(token, info);
    }

    public Cache<String, AtomicInteger> getPasswordRetryCache() {
        return passwordRetryCache;
    }

    public void setPasswordRetryCache(Cache<String, AtomicInteger> passwordRetryCache) {
        this.passwordRetryCache = passwordRetryCache;
    }
}
