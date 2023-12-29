package com.bean;

import java.io.Serializable;

public class Bean implements Serializable {

    int customerId ; 
    String firstName ;
    String lastName;
    long mobileNo;
    String email;
    int userId;
    String userName;
    String password;
    int itemId;
    String dishName;
    String type;
    float price;
    int regStatus;
    int orderId;
    int tableNo;
    String orderDate;
    int orderDetailId;
    String orderStatus;
    String name;
    String dateOfJoining;
    int feedbackId;
    String feedback;
    String status;
    String inquiry;
    int inquiryId;
    int staffId;

        public int getCustomerId(){
                        return customerId;
        }
    
                public void setCustomerId(int customerId){
                    this.customerId = customerId;
                }
        
 	public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}   
                
 	public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}                   

	public long getMobileNo() {
			return mobileNo;
		}
		public void setMobileNo(long mobileNo) {
			this.mobileNo = mobileNo;
		}       
                
	public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}       

    	public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}

	public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}  

	public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}  

    	public int getItemId() {
			return itemId;
		}
		public void setItemId(int itemId) {
			this.itemId = itemId;
		}

	public String getDishName() {
			return dishName;
		}
		public void setDishName(String dishName) {
			this.dishName = dishName;
		} 

	public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		} 

	public float getPrice() {
			return price;
		}
		public void setPrice(float price) {
			this.price = price;
		} 

    	public int getRegStatus() {
			return regStatus;
		}
		public void setRegStatus(int regStatus) {
			this.regStatus = regStatus;
		}

    	public int getOrderId() {
			return orderId;
		}
		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}
                
    	public int getTableNo() {
			return tableNo;
		}
		public void setTableNo(int tableNo) {
			this.tableNo = tableNo;
		}

	public String getOrderDate() {
			return orderDate;
		}
		public void setOrderDate(String orderDate) {
			this.orderDate = orderDate;
		} 

   	public int getOrderDetailId() {
			return orderDetailId;
		}
		public void setOrderDetailId(int orderDetailId) {
			this.orderDetailId = orderDetailId;
		}

	public String getOrderStatus() {
			return orderStatus;
		}
		public void setOrderStatus(String orderStatus) {
			this.orderStatus = orderStatus;
		} 
                
 	public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}  
                
 	public String getDateOfJoining() {
			return dateOfJoining;
		}
		public void setDateOfJoining(String dateOfJoining) {
			this.dateOfJoining = dateOfJoining;
		}  

	public int getFeedbackId() {
			return feedbackId;
		}
		public void setFeedbackId(int feedbackId) {
			this.feedbackId = feedbackId;
		}                
                
	public String getFeedback() {
			return feedback;
		}
		public void setFeedback(String feedback) {
			this.feedback = feedback;
		}  

	public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}  

	public String getInquiry() {
			return inquiry;
		}
		public void setInquiry(String inquiry) {
			this.inquiry = inquiry;
		} 

        public int getInquiryId(){
                        return inquiryId;
        }
    
                public void setInquiryId(int inquiryId){
                    this.inquiryId = inquiryId;
                }

        public int getStaffId(){
                        return staffId;
        }
    
                public void setStaffId(int staffId){
                    this.staffId = staffId;
                }        
                
}