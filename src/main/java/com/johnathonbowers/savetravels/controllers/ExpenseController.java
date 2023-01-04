package com.johnathonbowers.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.johnathonbowers.savetravels.models.Expense;
import com.johnathonbowers.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {

	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/expenses")
	public String getAll(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> allExpenses = expenseService.allExpenses();
		model.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
	}
	
	@PostMapping("/expenses/add")
	public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Expense> allExpenses = expenseService.allExpenses();
			model.addAttribute("allExpenses", allExpenses);
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/{id}")
	public String getOne(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "displayExpense.jsp";
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String editExpenseForm(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "editExpenseForm.jsp";
	}
	
	@PutMapping("/expenses/edit/{id}")
	public String editExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "editExpenseForm.jsp";
		} else {
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@DeleteMapping("/expenses/delete/{id}")
	public String destroyExpense(@PathVariable Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}
	
}











