<?php

namespace App\Form;

use App\Entity\Livre;
use App\Entity\Auteur;
use App\Entity\Categorie;
use App\Entity\Editeur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class LivreType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('titre')
            ->add('resume')
            ->add('prix')
            ->remove('image')
            ->add('imageFile', FileType::class, ['required' => false])
            ->add('code')
            ->add('active')
            ->add('categorie', EntityType::class, ["class" => Categorie::class, 'placeholder' => 'Choisi une catégorie', 'required' => false])
            ->add('auteur', EntityType::class, ["class" => Auteur::class, 'placeholder' => 'Auteur'])
            ->add('editeur', EntityType::class, ["class" => Editeur::class, 'placeholder' => 'Maison d\'édition'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Livre::class,
        ]);
    }
}
