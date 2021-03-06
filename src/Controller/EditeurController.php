<?php

namespace App\Controller;

use App\Entity\Editeur;
use App\Form\EditeurType;
use App\Repository\EditeurRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditeurController extends AbstractController
{
    // #[Route('/admin/editeur', name: 'editeur_index', methods: ['GET'])]
    /**
     * @Route("/admin/editeur", name="editeur_index", methods={"GET"})
     */
    public function index(EditeurRepository $editeurRepository): Response
    {
        return $this->render('editeur/index.html.twig', [
            'editeurs' => $editeurRepository->findAll(),
        ]);
    }

    // #[Route('/admin/editeur/new', name: 'editeur_new', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/editeur/new", name="editeur_new", methods={"GET", "POST"})
     */
    public function new(Request $request): Response
    {
        $editeur = new Editeur();
        $form = $this->createForm(EditeurType::class, $editeur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($editeur);
            $entityManager->flush();

            return $this->redirectToRoute('editeur_index');
        }

        return $this->render('editeur/new.html.twig', [
            'editeur' => $editeur,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/editeur/{id}', name: 'editeur_show', methods: ['GET'])]
    /**
     * @Route("/admin/editeur/{id}", name="editeur_show", methods={"GET"})
     */
    public function show(Editeur $editeur): Response
    {
        return $this->render('editeur/show.html.twig', [
            'editeur' => $editeur,
        ]);
    }

    // #[Route('/admin/editeur/{id}/edit', name: 'editeur_edit', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/editeur/{id}/edit", name="editeur_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Editeur $editeur): Response
    {
        $form = $this->createForm(EditeurType::class, $editeur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('editeur_index');
        }

        return $this->render('editeur/edit.html.twig', [
            'editeur' => $editeur,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/editeur/{id}', name: 'editeur_delete', methods: ['POST'])]
    /**
     * @Route("/admin/editeur/{id}", name="editeur_delete", methods={"GET"})
     */
    public function delete(Request $request, Editeur $editeur): Response
    {
        if ($this->isCsrfTokenValid('delete'.$editeur->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($editeur);
            $entityManager->flush();
        }

        return $this->redirectToRoute('editeur_index');
    }
}
