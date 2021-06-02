package me.jie2g.exam.service;

import me.jie2g.exam.domain.Admin;

import java.util.List;

public interface AdminSystemService {
    public List<Admin> adminLogin(String ano, String psw);
    public boolean updateAdmin(Admin admin);
}
