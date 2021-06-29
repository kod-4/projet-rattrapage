<?php

namespace App\Controller;

use App\Entity\Livre;
use App\Repository\LivreRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PanierController extends AbstractController
{
    // #[Route('/panier', name: 'panier')]
    /**
     * @Route("/panier", name="panier")
     */
    public function index(SessionInterface $sessionInterface, LivreRepository $livreRepository): Response
    {
        $cart = $sessionInterface->get('cart', []);
        $donnees = [];
        $total = 0;
        foreach($cart as $id => $quantite) {
            $livre = $livreRepository->find($id);
            $donnees[] = [
                'livre' => $livre,
                'quantite' => $quantite
            ];
            $total += $livre->getPrix() * $quantite;
        }
        return $this->render('panier/index.html.twig', compact('donnees', 'total'));
    }

    // #[Route('/add/{id}', name: 'add')]
    /**
     * @Route("/add/{id}", name="add")
     */
    public function add($id, SessionInterface $sessionInterface)
    {
        $cart = $sessionInterface->get('cart', []);
        // $id = $produit->getId();

        if(!empty($cart[$id])) {
            $cart[$id]++;
        }else {
            $cart[$id] = 1; 
        }

        $sessionInterface->set('cart', $cart);
        return $this->redirectToRoute('panier');
    }

    // #[Route('/remove/{id}', name: 'remove')]
    /**
     * @Route("/remove/{id}", name="remove")
     */
    public function remove(Livre $livre, SessionInterface $sessionInterface)
    {
        $cart = $sessionInterface->get('cart', []);
        $id = $livre->getId();

        if(!empty($cart[$id])) {
            if( ($cart[$id]) > 1) {
                $cart[$id]--;
            }else {
                unset($cart[$id]);
            }
        }
        $sessionInterface->set('cart', $cart);
        return $this->redirectToRoute('panier');
    }
    // #[Route('/delete/{id}', name: 'delete')]
    /**
     * @Route("/delete/{id}", name="delete")
     */
    public function delete(Livre $livre, SessionInterface $sessionInterface)
    {
        $cart = $sessionInterface->get('cart', []);
        $id = $livre->getId();

        if(!empty($cart[$id])) {
            unset($cart[$id]);
        }
        $sessionInterface->set('cart', $cart);
        return $this->redirectToRoute('panier');
    }
    // #[Route('/delete', name: 'void')]
    /**
     * @Route("/delete", name="void")
     */
    public function void(SessionInterface $sessionInterface)
    {
        $sessionInterface->remove('cart');
        return $this->redirectToRoute('panier');
    }
}
