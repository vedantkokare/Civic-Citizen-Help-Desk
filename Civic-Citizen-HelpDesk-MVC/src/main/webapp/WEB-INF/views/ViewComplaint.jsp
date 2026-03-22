<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<h3>Complaint Details</h3>

<p><strong>Complaint ID:</strong> ${complaint.complaintId}</p>
<p><strong>Status:</strong> ${complaint.status}</p>
<p><strong>Submitted By:</strong> ${complaint.name}</p>
<p><strong>Phone:</strong> ${complaint.phone}</p>
<p><strong>Category:</strong> ${complaint.category}</p>
<p><strong>Subject:</strong> ${complaint.subject}</p>
<p><strong>Description:</strong> ${complaint.description}</p>

<hr>

<h4>Location Details</h4>
<p><strong>Address:</strong> ${complaint.address}</p>
<p><strong>Area:</strong> ${complaint.area}</p>
<p><strong>Ward:</strong> ${complaint.ward}</p>
<p><strong>Village:</strong> ${complaint.village}</p>
<p><strong>Taluka:</strong> ${complaint.taluka}</p>
<p><strong>City:</strong> ${complaint.city}</p>
<p><strong>Pincode:</strong> ${complaint.pincode}</p>

<br>
<a href="/adminComplaintDashboard">Back</a>
