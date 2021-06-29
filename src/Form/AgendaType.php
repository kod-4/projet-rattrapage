<?php

namespace App\Form;

use App\Entity\Home;
use App\Entity\Agenda;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class AgendaType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('sujet')
            ->add('debut', DateTimeType::class, [
                'date_widget' => 'single_text'
            ])
            ->add('fin', DateTimeType::class, [
                'date_widget' => 'single_text'
            ])
            ->add('description', TextareaType::class)
            ->add('journee')
            ->remove('image')
            ->add('imageFile', FileType::class, ['required' => false])
            ->add('home', EntityType::class, [
                'class' => Home::class,
                'label' => 'Adresse',
                'multiple' => false
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Agenda::class,
        ]);
    }
}
