<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends AbstractController
{
    // #[Route('/inscription', name: 'user_inscription')]
    /**
     * @Route("/inscription", name="user_inscription")
     */
    public function register(Request $request, UserPasswordEncoderInterface $encoder): Response
    {
        // Mise en place d'un formulaire afin d'en envoyer la vue au twig
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        // On hydrate le formulaire
        $form->handleRequest($request);
        // Si le formulaire est renvoyé et valid quand on passe dans la méthode
        if($form->isSubmitted() && $form->isValid()){
            // On affecte un rôle à l'utilisateur car il n'y a pas de chois de role dans le formulaire
            $user->setRoles(['ROLE_USER']);
            $originePassword = $user->getPassword();
            $encodedPassword = $encoder->encodePassword($user, $originePassword);
            $user->setPassword($encodedPassword);
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
            return $this->redirectToRoute('accueil');
        }
        return $this->render('user/index.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
