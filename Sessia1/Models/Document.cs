using System;
using System.Collections.Generic;
using NpgsqlTypes;

namespace Sessia1.Models;

public partial class Document
{
    public int Idclient { get; set; }

    public NpgsqlPath? Path { get; set; }

    public int Id { get; set; }

    public virtual ICollection<Client> Idclients { get; set; } = new List<Client>();
}
