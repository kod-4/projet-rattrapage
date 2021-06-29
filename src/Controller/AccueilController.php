<?php

namespace App\Controller;

use App\Entity\Agenda;
use App\Form\AgendaType;
use App\Repository\AgendaRepository;
use App\Repository\HomeRepository;
use App\Repository\LivreRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AccueilController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    //#[Route('/', name: 'accueil')]
    public function index(LivreRepository $livreRepository, AgendaRepository $agendaRepository): Response
    {
        $livres = $livreRepository->findBy(["active" => 1]);
        $agendas = $agendaRepository->findAll();
        return $this->render('accueil/index.html.twig', [
            'livres' => $livres,
            'agendas' => $agendas
        ]);
    }
    /**
     * @Route("/lecture", name="lecture")
     */
    //#[Route('/lecture', name: 'lecture')]
    public function learning(LivreRepository $livreRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $livres = $paginator->paginate($livreRepository->findAll(["updatedAt"=>"ASC"]),
        $request->query->getInt('page', 1),
        4
        );
        return $this->render('accueil/page.html.twig', [
            'livres' => $livres
        ]);
    }
    /**
     * @Route("/rencontres", name="rencontres")
     */
    //#[Route('/rencontres', name: 'rencontres')]
    public function rencontre(AgendaRepository $agendaRepository): Response
    {
        $agendas = $agendaRepository->findAll();
        return $this->render('accueil/agenda.html.twig', [
            'agendas' => $agendas
        ]);
    }

    /**
     * @Route("/new", name="new_agenda", methods={"GET","POST"})
     */
    //#[Route('/new', name: 'new_agenda', methods: ['GET', 'POST'])]
    public function new(Request $request): Response
    {
        $agenda = new Agenda();
        $form = $this->createForm(AgendaType::class, $agenda);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($agenda);
            $entityManager->flush();

            return $this->redirectToRoute('rencontres');
        }

        return $this->render('accueil/new-agenda.html.twig', [
            'agenda' => $agenda,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/librairie", name="librairie")
     */
    //#[Route('/librairie', name: 'librairie')]
    public function library(HomeRepository $homeRepository): Response
    {
        $home = $homeRepository->findAll();
        return $this->render('accueil/librairie.html.twig', [
            'home' => $home
        ]);
    }
}
