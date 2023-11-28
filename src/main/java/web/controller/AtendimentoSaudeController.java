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

import web.dao.AlunoDao;
import web.dao.AtedimentoSaudeDao;
import web.dao.ProfissionalDao;

import web.modelo.AtendimentoSaude;
import web.modelo.Profissional;


@Transactional
@Controller
@RequestMapping("/atendimento_saude")
public class AtendimentoSaudeController {

	private List<AtendimentoSaude> lista_atendimento_saudes;

	@Autowired
	AtedimentoSaudeDao dao;
	
	@Autowired
	AlunoDao dao_aluno;
	
	@Autowired
	ProfissionalDao dao_profissional;


	@RequestMapping("/novo")
	public String atendimento_saude(Model model) {
		model.addAttribute("alunos", dao_aluno.listaAlunosAtivos());
		model.addAttribute("profissionals", dao_profissional.getBySection("saude"));
		return "atendimento_saude/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid AtendimentoSaude atendimento_saude, BindingResult result) {
		if (result.hasErrors() ) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(atendimento_saude);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_atendimento_saudes = dao.lista();
		model.addAttribute("atendimento_saudes", this.lista_atendimento_saudes);
		return "atendimento_saude/lista";
	}

	@RequestMapping("/remove")
	public String remove(AtendimentoSaude atendimento_saude) {
		dao.remove(atendimento_saude.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("atendimento_saude", dao.buscaPorId(id));
		return "atendimento_saude/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("atendimento_saude", dao.buscaPorId(id));
		model.addAttribute("alunos",  dao_aluno.listaAlunosAtivos());
		model.addAttribute("profissionals", dao_profissional.getBySection("saude"));
		return "atendimento_saude/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid AtendimentoSaude atendimento_saude, BindingResult result) {

	    if (result.hasErrors()) {
	        return "redirect:edita?id=" + atendimento_saude.getId();
	    }

	    dao.altera(atendimento_saude); 
	    return "redirect:lista";
	}
}

