<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220606135403 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE punten_detail (id INT AUTO_INCREMENT NOT NULL, student_id INT NOT NULL, datum DATE DEFAULT NULL, aantal INT NOT NULL, INDEX IDX_6DA56532CB944F1A (student_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE student (id INT AUTO_INCREMENT NOT NULL, naam VARCHAR(255) NOT NULL, voornaam VARCHAR(255) DEFAULT NULL, geboortedatum DATE DEFAULT NULL, punten INT DEFAULT NULL, geslacht INT DEFAULT NULL, UNIQUE INDEX UNIQ_B723AF33FC4DB938 (naam), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE teacher (id INT AUTO_INCREMENT NOT NULL, naam VARCHAR(255) NOT NULL, voornaam VARCHAR(255) DEFAULT NULL, geboortedatum DATE DEFAULT NULL, specialisatie VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, naam VARCHAR(255) DEFAULT NULL, voornaam VARCHAR(255) DEFAULT NULL, telefoon VARCHAR(50) DEFAULT NULL, is_verified TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE punten_detail ADD CONSTRAINT FK_6DA56532CB944F1A FOREIGN KEY (student_id) REFERENCES student (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE punten_detail DROP FOREIGN KEY FK_6DA56532CB944F1A');
        $this->addSql('DROP TABLE punten_detail');
        $this->addSql('DROP TABLE student');
        $this->addSql('DROP TABLE teacher');
        $this->addSql('DROP TABLE user');
    }
}
