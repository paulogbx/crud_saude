package web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ProfissionalDao;
import web.modelo.Profissional;

@Transactional
@Controller
@RequestMapping("/profissional")
public class ProfissionalController {

	private List<Profissional> lista_profissionals;

	@Autowired
	ProfissionalDao dao;

	@RequestMapping("/novo")
	public String profissional() {
		return "profissional/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Profissional profissional, BindingResult result) {
		if (result.hasErrors() || dao.buscaPorSiape(profissional.getSiape()).size()>0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(profissional);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_profissionals = dao.lista();
		model.addAttribute("profissionals", this.lista_profissionals);
		return "profissional/lista";
	}

	@RequestMapping("/remove")
	public String remove(Profissional profissional) {
		dao.remove(profissional.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("profissional", dao.buscaPorId(id));
		return "profissional/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("profissional", dao.buscaPorId(id));
		return "profissional/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Profissional profissional, BindingResult result) {
	    this.lista_profissionals = dao.buscaPorSiape(profissional.getSiape());

	    if (result.hasErrors() || (this.lista_profissionals.size() > 0 && this.lista_profissionals.get(0).getId()!= profissional.getId())) {
	        return "redirect:edita?id=" + profissional.getId();
	    }

	    dao.altera(profissional);
	    return "redirect:lista";
	}
}
