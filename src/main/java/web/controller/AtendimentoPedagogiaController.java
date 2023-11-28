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
import web.dao.AtendimentoPedagogiaDao;
import web.dao.ProfissionalDao;
import web.modelo.AtendimentoPedagogia;

@Transactional
@Controller
@RequestMapping("/atendimento_pedagogia")
public class AtendimentoPedagogiaController {

	private List<AtendimentoPedagogia> lista_atendimento_pedagogias;

	@Autowired
	AtendimentoPedagogiaDao dao;

	@Autowired
	AlunoDao dao_aluno;

	@Autowired
	ProfissionalDao dao_profissional;

	@RequestMapping("/novo")
	public String atendimento_pedagogia(Model model) {
		model.addAttribute("alunos", dao_aluno.listaAlunosAtivos());
		model.addAttribute("profissionals", dao_profissional.getBySection("pedagogia"));
		return "atendimento_pedagogia/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid AtendimentoPedagogia atendimento_pedagogia, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(atendimento_pedagogia);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_atendimento_pedagogias = dao.lista();
		model.addAttribute("atendimento_pedagogias", this.lista_atendimento_pedagogias);
		return "atendimento_pedagogia/lista";
	}

	@RequestMapping("/remove")
	public String remove(AtendimentoPedagogia atendimento_pedagogia) {
		dao.remove(atendimento_pedagogia.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("atendimento_pedagogia", dao.buscaPorId(id));
		return "atendimento_pedagogia/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("atendimento_pedagogia", dao.buscaPorId(id));
		model.addAttribute("alunos", dao_aluno.listaAlunosAtivos());
		model.addAttribute("profissionals", dao_profissional.getBySection("pedagogia"));
		return "atendimento_pedagogia/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid AtendimentoPedagogia atendimento_pedagogia, BindingResult result) {
		System.out.println(result);
		if (result.hasErrors()) {
			return "redirect:edita?id=" + atendimento_pedagogia.getId();
		}

		dao.altera(atendimento_pedagogia);
		return "redirect:lista";
	}
}
