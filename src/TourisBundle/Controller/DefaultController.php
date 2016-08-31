<?php

namespace TourisBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('TourisBundle:Default:index.html.twig');
    }
}
