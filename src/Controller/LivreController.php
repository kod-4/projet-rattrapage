<?php

namespace App\Controller;

use DateTime;
use App\Entity\Livre;
use App\Form\LivreType;
use App\Entity\Commentaires;
use App\Form\CommentaireType;
use App\Repository\LivreRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class LivreController extends AbstractController
{
    // #[Route('/livre/detail/{id}', name: 'livre_detail')]
    /**
     * @Route("/livre/detail/{id}", name="livre_detail")
     */
    public function livreDetail($id, LivreRepository $livreRepository, Request $request):Response
    {
        $commentaires = new Commentaires;
        //Générer le formulaire
        $form = $this->createForm(CommentaireType::class, $commentaires);
        $form->handleRequest($request);

        //Traiter le formulaire
        if($form->isSubmitted() && $form->isValid()) {
            $commentaires->setCreatedAt(new DateTime());
            $commentaires->setLivres($livre = $livreRepository->find($id));

            //Récupérer le contenu de reponseid
            $reponseid = $form->get("reponseid")->getData();
            $em = $this->getDoctrine()->getManager();

            // Aller chercher la commentaire
            if($reponseid != null){
                $reponse = $em->getRepository(Commentaires::class)->find($reponseid);
            }

            //Définir la réponse
            $commentaires->setReponse($reponse ?? null);
            $em->persist($commentaires);
            $em->flush();

            return $this->redirectToRoute('livre_detail', ['id' =>
            $livre->getId()]);
        }
        return $this->render("livre/livre.html.twig", [
            "livre"=>$livreRepository->find($id),
            "form" => $form->createView()
        ]);
        
    
    }

    // #[Route('/add/{id}', name: 'add')]
    // public function add($id, SessionInterface $sessionInterface)
    // {
    //     $cart = $sessionInterface->get('cart', []);

    //     if(!empty($cart[$id])) {
    //         $cart[$id]++;
    //     }else {
    //         $cart[$id] = 1; 
    //     }

    //     $sessionInterface->set('cart', $cart);
    //     return $this->redirectToRoute('cart_index');
    // }

    // #[Route('/admin/livre', name: 'livre_index', methods: ['GET'])]
    /**
     * @Route("/admin/livre", name="livre_index", methods={"GET"})
     */
    public function index(LivreRepository $livreRepository): Response
    {
        return $this->render('livre/index.html.twig', [
            'livres' => $livreRepository->findAll(),
        ]);
    }

    // #[Route('/admin/livre/new', name: 'livre_new', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/livre/new", name="livre_new", methods={"GET", "POST"})
     */
    public function new(Request $request): Response
    {
        $livre = new Livre();
        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($livre);
            $entityManager->flush();

            return $this->redirectToRoute('livre_index');
        }

        return $this->render('livre/new.html.twig', [
            'livre' => $livre,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/livre/{id}', name: 'livre_show', methods: ['GET'])]
    /**
     * @Route("/admin/livre/{id}", name="livre_show", methods={"GET"})
     */
    public function show(Livre $livre): Response
    {
        return $this->render('livre/show.html.twig', [
            'livre' => $livre,
        ]);
    }

    // #[Route('/admin/livre/{id}/edit', name: 'livre_edit', methods: ['GET', 'POST'])]
    /**
     * @Route("/admin/livre/{id}/edit", name="livre_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Livre $livre): Response
    {
        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('livre_index');
        }

        return $this->render('livre/edit.html.twig', [
            'livre' => $livre,
            'form' => $form->createView(),
        ]);
    }

    // #[Route('/admin/livre/{id}', name: 'livre_delete', methods: ['POST'])]
    /**
     * @Route("/admin/livre/{id}", name="livre_delete", methods={"POST"})
     */
    public function delete(Request $request, Livre $livre): Response
    {
        if ($this->isCsrfTokenValid('delete'.$livre->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($livre);
            $entityManager->flush();
        }

        return $this->redirectToRoute('livre_index');
    }
}
