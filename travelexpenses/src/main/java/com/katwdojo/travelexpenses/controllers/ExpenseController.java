package com.katwdojo.travelexpenses.controllers;

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

import com.katwdojo.travelexpenses.models.Expense;
import com.katwdojo.travelexpenses.services.ExpenseServices;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseServices expenseService;
	
	@GetMapping("/")
	public String home(Model viewModel, @ModelAttribute("expenses")Expense expenses) {
		viewModel.addAttribute("expenses", expenseService.getAllExpenses());
		return "home.jsp";
	}
	
	@PostMapping("/newexpense")
	public String newExpense(@Valid @ModelAttribute("expenses") Expense expenses, BindingResult result) {
		if (result.hasErrors()) {
			return "home.jsp";
		}else {
			expenseService.saveExpense(expenses);
			return "redirect:/";
		}
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model editModel) {
		Expense editExpense = expenseService.findExpense(id);
		editModel.addAttribute("editExpense", editExpense);
		return "edit.jsp";
	}
	
	@PutMapping("/editexpense/{id}")
	public String update(@PathVariable Long id, @ModelAttribute("editExpense") Expense expenses) {
		expenseService.updateExpense(expenses);
		return "redirect:/";
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/";
	}
}
