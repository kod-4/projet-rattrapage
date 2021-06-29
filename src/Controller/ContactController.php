<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\ContactType;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContactController extends AbstractController
{
    // #[Route('/contact', name: 'contact')]
    /**
     * @Route("/contact", name="contact")
     */
    public function index(): Response
    {
        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
        ]);
    }
    // #[Route('/mailer', name: 'mailer')]
    /**
     * @Route("/mailer", name="mailer")
     */
    public function mailing(Request $request, MailerInterface $mailer): Response
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($contact);
            $entityManager->flush();
            // Envoi du mail
            $email = (new TemplatedEmail())
            ->from($contact->getEmail())
            ->to('Doucoureissa98@outlook.fr')
            ->subject($contact->getSujet())
            ->htmlTemplate('contact/boite.html.twig')
            ->context([
                'mail' => $contact->getEmail(),
                'nom' => $contact->getNom(),
                'prenom' => $contact->getPrenom(),
                'sujet' => $contact->getSujet(),
                'message' => $contact->getMessage()
            ]);

        $mailer->send($email);

        $this->addFlash('message', 'L\'e-mail a été envoyé avec succés');
        return $this->redirectToRoute('mailer');
            
        }
        return $this->render('contact/index.html.twig', [
            'form' => $form->createView(),
        ]);

    }
}
