<?php

namespace App\Controller;

use App\Entity\Rencontre;
use App\Form\RencontreType;
use App\Repository\RencontreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class RencontreController extends AbstractController
{
    // #[Route('/admin/rencontre', name: 'rencontre_index', methods: ['GET'])]
    /**
     * @Route("/admin/rencontre", name="rencontre_index", methods={"GET"})
     */
    public function index(RencontreRepository $rencontreRepository): Response
    {
        return $this->render('rencontre/index.html.twig', [
            'rencontres' => $rencontreRepository->findAll(),
        ]);
    }

    // #[Route('/admin/rencontre/new', name: 'rencontre_new', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/rencontre/new", name="rencontre_new", methods={"GET", "POST"})
     */
    public function new(Request $request): Response
    {
        $rencontre = new Rencontre();
        $form = $this->createForm(RencontreType::class, $rencontre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($rencontre);
            $entityManager->flush();

            return $this->redirectToRoute('rencontre_index');
        }

        return $this->render('rencontre/new.html.twig', [
            'rencontre' => $rencontre,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/rencontre/{id}', name: 'rencontre_show', methods: ['GET'])]
    /**
     * @Route("/admin/rencontre/{id}", name="rencontre_show", methods={"GET"})
     */
    public function show(Rencontre $rencontre): Response
    {
        return $this->render('rencontre/show.html.twig', [
            'rencontre' => $rencontre,
        ]);
    }

    // #[Route('/admin/rencontre/{id}/edit', name: 'rencontre_edit', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/rencontre/{id}/edit", name="rencontre_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Rencontre $rencontre): Response
    {
        $form = $this->createForm(RencontreType::class, $rencontre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('rencontre_index');
        }

        return $this->render('rencontre/edit.html.twig', [
            'rencontre' => $rencontre,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/rencontre/{id}', name: 'rencontre_delete', methods: ['POST'])]
    /**
     * @Route("/admin/rencontre/{id}", name="rencontre_delete", methods={"POST"})
     */
    public function delete(Request $request, Rencontre $rencontre): Response
    {
        if ($this->isCsrfTokenValid('delete'.$rencontre->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($rencontre);
            $entityManager->flush();
        }

        return $this->redirectToRoute('rencontre_index');
    }
}
