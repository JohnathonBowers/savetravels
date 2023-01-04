package com.johnathonbowers.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.johnathonbowers.savetravels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{

	// this method retrieves all the expenses from the database
	List<Expense> findAll();
	
}
