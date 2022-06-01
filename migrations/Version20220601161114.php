<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220601161114 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE vak (id INT AUTO_INCREMENT NOT NULL, naam VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE vak_teacher (id INT AUTO_INCREMENT NOT NULL, teacher_id INT NOT NULL, vak_id INT NOT NULL, INDEX IDX_3C9FC1AA41807E1D (teacher_id), INDEX IDX_3C9FC1AABDCC7DA2 (vak_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE vak_teacher ADD CONSTRAINT FK_3C9FC1AA41807E1D FOREIGN KEY (teacher_id) REFERENCES teacher (id)');
        $this->addSql('ALTER TABLE vak_teacher ADD CONSTRAINT FK_3C9FC1AABDCC7DA2 FOREIGN KEY (vak_id) REFERENCES vak (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE vak_teacher DROP FOREIGN KEY FK_3C9FC1AABDCC7DA2');
        $this->addSql('DROP TABLE vak');
        $this->addSql('DROP TABLE vak_teacher');
    }
}
