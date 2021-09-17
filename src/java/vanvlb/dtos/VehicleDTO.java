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
public class VehicleDTO {
    private String proID;
    private String proName;
    private float price;
    private int quantity;
    private int cateID;

    public VehicleDTO() {
    }

    public VehicleDTO(String proID, String proName, float price, int quantity, int cateID, boolean status) {
        this.proID = proID;
        this.proName = proName;
        this.price = price;
        this.quantity = quantity;
        this.cateID = cateID;
    }

    public VehicleDTO(String proID, String proName, float price, int quantity, int cateID) {
        this.proID = proID;
        this.proName = proName;
        this.price = price;
        this.quantity = quantity;
        this.cateID = cateID;//To change body of generated methods, choose Tools | Templates.
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    
}
