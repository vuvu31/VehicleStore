/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanvlb.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Mon
 */
public class CartDTO {

    private String customerID;
    private Map<String, VehicleDTO> items;

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Map<String, VehicleDTO> getItems() {
        return items;
    }

    public void addVehicleToCart(String id, VehicleDTO dto) {
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(id)) {
            quantity = this.items.get(id).getQuantity() + 1;
        }
        VehicleDTO vehicle = new VehicleDTO(dto.getProID(), dto.getProName(), dto.getPrice(), quantity, dto.getCateID());
        this.items.put(id, vehicle);
    }

    public void removeVehicleFromCart(String id){
        if(this.items == null){
            return;
        }
        if(this.items.containsKey(id)){
            this.items.remove(id);
            if(this.items.isEmpty()){
                this.items = null;
            }
        }
    }
}
