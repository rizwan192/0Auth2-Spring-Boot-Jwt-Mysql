package com.example.AuthServer.dao;

import com.example.AuthServer.model.UserEntity;

public interface OAuthDAOService {

	public UserEntity getUserDetails(String emailId);
}
