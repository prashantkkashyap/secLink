package com

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

/**
 * Created by prashant on 13/7/15.
 */
class UserDetails extends GrailsUser{

        final String fullName

    UserDetails(String username, String password, boolean enabled,
                boolean accountNonExpired, boolean credentialsNonExpired,
                boolean accountNonLocked,
                Collection<GrantedAuthority> authorities,
                long id, String fullName) {
            super(username, password, enabled, accountNonExpired,
                    credentialsNonExpired, accountNonLocked, authorities, id)

            this.fullName = fullName
        }

    }
