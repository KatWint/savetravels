package com.katwdojo.travelexpenses.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.katwdojo.travelexpenses.models.Expense;
import com.katwdojo.travelexpenses.repositories.ExpenseRepository;

@Service
public class ExpenseServices {
	@Autowired
	private ExpenseRepository expenseRepo;
	
	public List<Expense> getAllExpenses(){
		return expenseRepo.findAll();
	}
	public Expense saveExpense(Expense e) {
		return expenseRepo.save(e);
	}
	public Expense updateExpense(Expense e) {
		return expenseRepo.save(e);
	}
	
	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}
	
	public Expense findExpense(Long id) {
		return expenseRepo.findById(id).orElse(null);
	}
}
