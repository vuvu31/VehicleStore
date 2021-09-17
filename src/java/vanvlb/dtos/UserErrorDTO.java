/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.dtos;

/**
 *
 * @author Mon
 */
public class UserErrorDTO {
    private String userIDErr;
    private String passwordErr;
    private String confirmErr;
    private String phoneErr;
    private String addressErr;
    private String roleIDErr;
    private String fullNameErr;

    public UserErrorDTO() {
    }

    public UserErrorDTO(String userIDErr, String passwordErr, String confirmErr, String phoneErr, String addressErr, String roleIDErr, String fullNameErr) {
        this.userIDErr = userIDErr;
        this.passwordErr = passwordErr;
        this.confirmErr = confirmErr;
        this.phoneErr = phoneErr;
        this.addressErr = addressErr;
        this.roleIDErr = roleIDErr;
        this.fullNameErr = fullNameErr;
    }

    public String getUserIDErr() {
        return userIDErr;
    }

    public void setUserIDErr(String userIDErr) {
        this.userIDErr = userIDErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getConfirmErr() {
        return confirmErr;
    }

    public void setConfirmErr(String confirmErr) {
        this.confirmErr = confirmErr;
    }

    public String getPhoneErr() {
        return phoneErr;
    }

    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

    public String getAddressErr() {
        return addressErr;
    }

    public void setAddressErr(String addressErr) {
        this.addressErr = addressErr;
    }

    public String getRoleIDErr() {
        return roleIDErr;
    }

    public void setRoleIDErr(String roleIDErr) {
        this.roleIDErr = roleIDErr;
    }

    public String getFullNameErr() {
        return fullNameErr;
    }

    public void setFullNameErr(String fullNameErr) {
        this.fullNameErr = fullNameErr;
    }

    
    
    
}
