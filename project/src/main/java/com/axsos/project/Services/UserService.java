package com.axsos.project.Services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.axsos.project.Repositires.RoleRepository;
import com.axsos.project.Repositires.UserRepository;
import com.axsos.project.models.User;
import com.axsos.project.models.Role;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        List<Role> userRoles = roleRepository.findByName("ROLE_USER");
        user.setRoles(userRoles);
        userRepository.save(user);
    }

    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        List<Role> adminRoles = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(adminRoles);
        userRepository.save(user);
    }

    public User findByUsername(String username) {
        return userRepository.findByUserName(username);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
