<?php

namespace App\Entity;

use App\Repository\StudentRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StudentRepository::class)
 */
class Student
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, unique=true)
     */
    private $naam;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $voornaam;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $geboortedatum;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $punten;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $geslacht;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNaam(): ?string
    {
        return $this->naam;
    }

    public function setNaam(string $naam): self
    {
        $this->naam = $naam;

        return $this;
    }

    public function getVoornaam(): ?string
    {
        return $this->voornaam;
    }

    public function setVoornaam(?string $voornaam): self
    {
        $this->voornaam = $voornaam;

        return $this;
    }

    public function getGeboortedatum(): ?\DateTimeInterface
    {
        return $this->geboortedatum;
    }

    public function setGeboortedatum(?\DateTimeInterface $geboortedatum): self
    {
        $this->geboortedatum = $geboortedatum;

        return $this;
    }

    public function getPunten(): ?int
    {
        return $this->punten;
    }

    public function setPunten(?int $punten): self
    {
        $this->punten = $punten;

        return $this;
    }

    public function getGeslacht(): ?int
    {
        return $this->geslacht;
    }

    public function setGeslacht(?int $geslacht): self
    {
        $this->geslacht = $geslacht;

        return $this;
    }
}
