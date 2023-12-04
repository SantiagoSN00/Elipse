<<<<<<< HEAD
using Elipse.Models;
using Microsoft.EntityFrameworkCore;

=======
>>>>>>> 50fcd9decefa47db444c37ec43301f68abbe8b61
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
<<<<<<< HEAD
builder.Services.AddDbContext<ChatContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("ChatContext") ?? throw new InvalidOperationException("Connection string 'ChatContext' not found.")));
=======
>>>>>>> 50fcd9decefa47db444c37ec43301f68abbe8b61

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
