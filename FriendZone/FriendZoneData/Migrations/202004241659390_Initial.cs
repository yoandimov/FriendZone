namespace FriendZoneData.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.commentaire",
                c => new
                    {
                        commentaire_id = c.Int(nullable: false, identity: true),
                        user_id = c.Int(nullable: false),
                        post_id = c.Int(nullable: false),
                        tagged_user_id = c.Int(nullable: false),
                        message = c.String(),
                        date_created = c.String(),
                        Username = c.String(),
                        profile_image = c.String(),
                    })
                .PrimaryKey(t => t.commentaire_id)
                .ForeignKey("dbo.post", t => t.post_id, cascadeDelete: true)
                .Index(t => t.post_id);
            
            CreateTable(
                "dbo.like",
                c => new
                    {
                        user_id = c.Int(nullable: false),
                        post_id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.user_id, t.post_id });
            
            CreateTable(
                "dbo.post",
                c => new
                    {
                        post_id = c.Int(nullable: false, identity: true),
                        user_id = c.Int(nullable: false),
                        title = c.String(),
                        Username = c.String(),
                        profile_image = c.String(),
                        date_created = c.String(),
                        image = c.String(),
                        content = c.String(),
                    })
                .PrimaryKey(t => t.post_id)
                .ForeignKey("dbo.user", t => t.user_id, cascadeDelete: true)
                .Index(t => t.user_id);
            
            CreateTable(
                "dbo.user",
                c => new
                    {
                        user_id = c.Int(nullable: false, identity: true),
                        first_name = c.String(),
                        last_name = c.String(),
                        city = c.String(),
                        gender = c.String(),
                        country = c.String(),
                        description = c.String(),
                        profile_image = c.String(),
                        Username = c.String(),
                        password = c.String(),
                        email = c.String(),
                        permision = c.String(),
                    })
                .PrimaryKey(t => t.user_id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.post", "user_id", "dbo.user");
            DropForeignKey("dbo.commentaire", "post_id", "dbo.post");
            DropIndex("dbo.post", new[] { "user_id" });
            DropIndex("dbo.commentaire", new[] { "post_id" });
            DropTable("dbo.user");
            DropTable("dbo.post");
            DropTable("dbo.like");
            DropTable("dbo.commentaire");
        }
    }
}
