package com.johnathonbowers.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.johnathonbowers.savetravels.models.Expense;
import com.johnathonbowers.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

	// adding the expense repository as a dependency
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	// returns all expenses
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	// creates an expense
	public Expense createExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	// retrieves an expense
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
	// updates an expense
	public Expense updateExpense(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	// deletes an expense
	public void deleteExpense(Long id) {
		expenseRepository.deleteById(id);
	}
	
}


















