using System;
using System.Collections.Generic;

namespace Sessia1.Models;

public partial class Visit
{
    public int Id { get; set; }

    public DateOnly Data { get; set; }

    public TimeOnly Time { get; set; }

    public string? Idclient { get; set; }

    public virtual ICollection<Client> Idclients { get; set; } = new List<Client>();
}
